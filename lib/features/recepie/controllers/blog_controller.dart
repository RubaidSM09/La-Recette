import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:t_store/common/widgets/loader/loaders.dart';
import 'package:t_store/data/repositories/blog/blog_repository.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/features/recepie/controllers/notifications_controller.dart';
import 'package:t_store/features/recepie/models/blog_model.dart';

class BlogController extends GetxController {
  static BlogController get instance => Get.find();
  final controller = Get.put(UserController());
  final notificationsController = NotificationsController.instance;

  final isLoading = false.obs;
  final blogRepository = Get.put(BlogRepository());
  RxList<BlogModel> approvedBlogs = <BlogModel>[].obs;
  RxList<BlogModel> pendingBlogs = <BlogModel>[].obs;
  RxList<BlogModel> myBlogs = <BlogModel>[].obs;
  RxList<BlogModel> filteredBlogs = <BlogModel>[].obs;

  var blogId = ''.obs;
  var blogTitle = ''.obs;
  var blogAuthor = ''.obs;
  var blogAuthorId = ''.obs;
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

      filteredBlogs.assignAll(approvedBlogs);

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
      blogAuthorId.value = controller.user.value.id;
      String? imageUrl;
      if (image.value != null) {
        imageUrl = await uploadImage(image.value!);
      }
      blogImage.value = imageUrl!;
      String generatedBlogId = await blogRepository.addBlog(blogTitle.value, blogAuthor.value, blogAuthorId.value, blogContent.value, blogImage.value);

      notificationsController.sendNotifications(
        "You have a new blog pending",  // Title
        "Blog Pending",                  // Type
        generatedBlogId,                 // Path
        blogImage.value,                 // Image
        "jCtTIRLxdYT6Ri5dEhU3aKuk75x1",     // Admin Id
      );
    } catch(e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void approveBlog(BlogModel blog) async {
    try {
      await blogRepository.updateBlog(
        blogId.value,
      );

      notificationsController.sendNotifications(
        "Your recipe '${blog.title}' had been approved",  // Title
        "Recipe Upload",                  // Type
        blogId.value,                 // Path
        blog.image.toString(),                 // Image
        blog.authorId,     // Chef's Id
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

  Future<List<BlogModel>> fetchMyBlogs(String chef) async {
    try {
      // Show loader while loading Recipes
      isLoading.value = true;

      // Fetch Recipes
      final blogs = await blogRepository.getMyBlogs(chef);

      // Assign Recipes
      myBlogs.assignAll(blogs);
      return myBlogs;

    } catch(e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    } finally {
      isLoading.value = false;
    }
  }

  /// -- Search blogs by Title or Author
  void searchBlogs(String query) {
    if (query.isEmpty) {
      // If search query is empty, reset the filtered recipes to all approved recipes
      filteredBlogs.assignAll(approvedBlogs);
    } else {
      filteredBlogs.assignAll(
        approvedBlogs.where((blog) =>
        blog.title.toLowerCase().contains(query.toLowerCase()) ||
            blog.author.toLowerCase().contains(query.toLowerCase()))
            .toList(),
      );
    }
  }
}