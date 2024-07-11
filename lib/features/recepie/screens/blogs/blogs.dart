import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:t_store/features/personalization/screens/settings/settings.dart';
import 'package:t_store/features/recepie/controllers/blog_controller.dart';
import 'package:t_store/features/recepie/screens/blogs/add_blogs/add_blogs.dart';
import 'package:t_store/features/recepie/screens/blogs/widgets/blogCard.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
// import 'dart:html' as html;

/*class BlogPage extends StatefulWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  String? _imageFileUrl;
  String? _videoFileUrl;
  List<Map<String, String?>> _blogs = [];
  String _sortOption = 'Popularity';
  List<String> _sortOptions = ['Popularity', 'Newest', 'Oldest'];

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      // final blob = html.Blob([bytes]);
      // final url = html.Url.createObjectUrlFromBlob(blob);
      setState(() {
        // _imageFileUrl = url;
        _videoFileUrl = null;
      });
    }
  }

  Future<void> _pickVideo() async {
    final pickedFile = await _picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      // final blob = html.Blob([bytes]);
      // final url = html.Url.createObjectUrlFromBlob(blob);
      setState(() {
        // _videoFileUrl = url;
        _imageFileUrl = null;
      });
    }
  }

  void _uploadBlog() {
    if (_textController.text.isEmpty && _imageFileUrl == null && _videoFileUrl == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please add some text, an image, or a video')),
      );
      return;
    }

    setState(() {
      _blogs.add({
        'text': _textController.text,
        'imageUrl': _imageFileUrl,
        'videoUrl': _videoFileUrl,
      });

      _textController.clear();
      _imageFileUrl = null;
      _videoFileUrl = null;
    });
  }

  void _sortBlogs(String sortOption) {
    setState(() {
      _sortOption = sortOption;
      // Add sorting logic based on the selected option
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(0xFFE85A4F),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Blog Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: 'Search blogs...',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none, // Remove border
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                  labelStyle: TextStyle(color: Colors.black),
                ),
                style: TextStyle(color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Sort by:', style: TextStyle(color: Colors.black)),
                  DropdownButton<String>(
                    value: _sortOption,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        _sortBlogs(newValue);
                      }
                    },
                    items: _sortOptions.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: TextStyle(color: Colors.black)),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _textController,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Write your blog...',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none, // Remove border
                  ),
                  labelStyle: TextStyle(color: Colors.black),
                ),
                style: TextStyle(color: Colors.black),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.image),
                  color: Colors.black,
                  onPressed: _pickImage,
                ),
                IconButton(
                  icon: Icon(Icons.videocam),
                  color: Colors.black,
                  onPressed: _pickVideo,
                ),
              ],
            ),
            if (_imageFileUrl != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(_imageFileUrl!),
              ),
            if (_videoFileUrl != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Video selected: $_videoFileUrl', style: TextStyle(color: Colors.black)),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: _uploadBlog,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFE85A4F), // Button background color
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0), // Button padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0), // Remove border radius
                  ),
                  elevation: 0, // Remove shadow
                ),
                child: Text(
                  'Upload Blog',
                  style: TextStyle(color: Colors.white), // Button text color
                ),
              ),
            ),
            SizedBox(
              height: 400,
              child: ListView.builder(
                itemCount: _blogs.length,
                itemBuilder: (context, index) {
                  final blog = _blogs[index];
                  return Card(
                    margin: EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(blog['text'] ?? '', style: TextStyle(color: Colors.black)),
                          if (blog['imageUrl'] != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Image.network(blog['imageUrl']!),
                            ),
                          if (blog['videoUrl'] != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text('Video selected: ${blog['videoUrl']}', style: TextStyle(color: Colors.black)),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    final controller = Get.put(BlogController());

    return Scaffold(
      appBar: TAppBar(
        title: Text('Blogs', style: Theme.of(context).textTheme.headlineMedium!.apply(color: dark ? TColors.dark : const Color(0xFFE85A4F))),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: dark ? TColors.dark : const Color(0xFFE85A4F),
        onPressed: () => Get.to(() => const AddBlogsScreen()),
        child: Icon(Icons.add, color: dark ? TColors.light : TColors.dark,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: TSizes.defaultSpace),
          child: Column(
            children: [
              const TSearchContainer(text: 'Search Ingredients'),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Obx((){
                  if(controller.isLoading.value) return const TVerticalProductShimmer();

                  if(controller.approvedBlogs.isEmpty) {
                    return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium));
                  }
                  return GridView.builder(
                    itemCount: controller.approvedBlogs.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisExtent: 288,
                      mainAxisSpacing: TSizes.gridViewSpacing,
                      crossAxisSpacing: TSizes.gridViewSpacing,
                    ),
                    itemBuilder: (_, index) => BlogsCard(blog: controller.approvedBlogs[index]),
                  );
                }

                ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}

