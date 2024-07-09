import 'package:get/get.dart';
import 'package:t_store/common/widgets/loader/loaders.dart';
import 'package:t_store/data/repositories/blog/blog_repository.dart';
import 'package:t_store/features/recepie/models/blog_model.dart';

class BlogController extends GetxController {
  static BlogController get instance => Get.find();

  final isLoading = false.obs;
  final blogRepository = Get.put(BlogRepository());
  RxList<BlogModel> allBlogs = <BlogModel>[].obs;

  @override
  void onInit() {
    fetchAllBlogs();
    super.onInit();
  }

  void fetchAllBlogs() async {
    try {
      // Show loader while loading Recipes
      isLoading.value = true;

      // Fetch Recipes
      final blogs = await blogRepository.getAllBlogs();

      // Assign Recipes
      allBlogs.assignAll(blogs);

    } catch(e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}