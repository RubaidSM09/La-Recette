import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:t_store/common/widgets/loader/loaders.dart';
import 'package:t_store/data/repositories/blog/blog_repository.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/features/recepie/models/blog_model.dart';

class BlogController extends GetxController {
  static BlogController get instance => Get.find();
  final controller = Get.put(UserController());

  final isLoading = false.obs;
  final blogRepository = Get.put(BlogRepository());
  RxList<BlogModel> approvedBlogs = <BlogModel>[].obs;
  RxList<BlogModel> pendingBlogs = <BlogModel>[].obs;

  var blogId = ''.obs;
  var blogTitle = ''.obs;
  var blogAuthor = ''.obs;
  var blogContent = ''.obs;
  var blogImage = ''.obs;
  var image = Rx<File?>(null);
  var isPending = true.obs;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    }
    // blogImage.value = image.value!.path;
  }

  Future<String?> uploadImage(File image) async {
    try {
      String fileName = image.path.split('/').last;
      TaskSnapshot snapshot = await _storage.ref('blog_images/$fileName').putFile(image);
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

  @override
  void onInit() {
    fetchApprovedBlogs();
    fetchPendingBlogs();
    super.onInit();
  }

  void fetchApprovedBlogs() async {
    try {
      // Show loader while loading Recipes
      isLoading.value = true;

      // Fetch Recipes
      final blogs = await blogRepository.getApprovedBlogs();

      // Assign Recipes
      approvedBlogs.assignAll(blogs);

    } catch(e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void fetchPendingBlogs() async {
    try {
      // Show loader while loading Recipes
      isLoading.value = true;

      // Fetch Recipes
      final blogs = await blogRepository.getPendingBlogs();

      // Assign Recipes
      pendingBlogs.assignAll(blogs);

    } catch(e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void submitBlog() async {
    try {
      blogAuthor.value = controller.user.value.fullName;
      String? imageUrl;
      if (image.value != null) {
        imageUrl = await uploadImage(image.value!);
      }
      blogImage.value = imageUrl!;
      await blogRepository.addBlog(blogTitle.value, blogAuthor.value, blogContent.value, blogImage.value);
    } catch(e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void approveBlog() async {
    try {
      await blogRepository.updateBlog(
        blogId.value,
      );
      // Handle success (e.g., show a success message, navigate to another screen, etc.)
    } catch (e) {
      // Handle error (e.g., show an error message)
      print('Error submitting recipe: $e');
    }
  }

  void declineBlog() async {
    try {
      await blogRepository.deleteBlog(
        blogId.value,
      );
      // Handle success (e.g., show a success message, navigate to another screen, etc.)
    } catch (e) {
      // Handle error (e.g., show an error message)
      print('Error submitting recipe: $e');
    }
  }
}