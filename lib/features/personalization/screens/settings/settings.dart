import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/personalization/screens/profile/profile.dart';
import 'package:t_store/features/personalization/screens/settings/add-recipe/add_recipe.dart';
// import 'package:t_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
// import 'package:t_store/common/widgets/list_tiles/settings_menu_tile.dart';
// import 'package:t_store/features/personalization/screens/address/address.dart';
// import 'package:t_store/features/shop/screens/cart/cart.dart';
//
// import '../../../../common/widgets/appbar/appbar.dart';
// import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
// import '../../../../common/widgets/texts/section_heading.dart';
// import '../../../shop/screens/order/order.dart';
// import '../profile/profile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth= AuthenticationRepository.instance;
    return Scaffold(
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       ///Header
      //       TPrimaryHeaderContainer(
      //         child: Column(
      //           children: [
      //             ///Appbar
      //             TAppBar(title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white))),
      //             const SizedBox(height: TSizes.spaceBtwSections,),
      //             ///User Profile Card
      //             TUserProfileTile(onPressed:() => Get.to(() => const ProfileScreen())),
      //             const SizedBox(height: TSizes.spaceBtwSections,),
      //           ],
      //         ),
      //       ),
      //       ///Body
      //       Padding(
      //           padding: const EdgeInsets.all(TSizes.defaultSpace),
      //           child: Column(
      //             children: [
      //               const TSectionHeading(title: 'Account Settings', showActionButton:false),
      //               const SizedBox(height: TSizes.spaceBtwItems,),
      //
      //               TSettingsMenuTile(icon: Iconsax.safe_home, title: 'My Addresses', subTitle: 'Set shopping delivery address',onTap: () => Get.to(() => const UserAddressScreen())),
      //               TSettingsMenuTile(icon: Iconsax.shopping_cart, title: 'My Cart', subTitle: 'Add,remove products and move to checkout',onTap: ()=> Get.to(()=> const CartScreen())),
      //               TSettingsMenuTile(icon: Iconsax.bag_tick, title: 'My Orders', subTitle: 'In-progress and completed orders',onTap: () => Get.to(() => const OrderScreen()),),
      //               TSettingsMenuTile(icon: Iconsax.bank, title: 'Bank Account', subTitle: 'Withdraw balance to registered bank account',onTap: (){},),
      //               TSettingsMenuTile(icon: Iconsax.discount_shape, title: 'My Coupons', subTitle: 'List of all the discounted coupons',onTap: (){},),
      //               TSettingsMenuTile(icon: Iconsax.notification, title: 'Notifications', subTitle: 'Set any kind of notification message',onTap: (){},),
      //               TSettingsMenuTile(icon: Iconsax.security_card, title: 'Account Privacy', subTitle: 'Manage data usage and connected accounts',onTap: (){},),
      //
      //               ///App Settings
      //               const SizedBox(height: TSizes.spaceBtwSections,),
      //               const TSectionHeading(title: 'App Settings', showActionButton:false),
      //               const SizedBox(height: TSizes.spaceBtwItems,),
      //               TSettingsMenuTile(icon: Iconsax.document_upload, title: 'Load Data', subTitle: 'Set  recommendation based on location',onTap: (){},),
      //               TSettingsMenuTile(
      //                 icon: Iconsax.location,
      //                 title: 'Geolocation',
      //                 subTitle: 'Upload Data to your Cloud Firebase',
      //                 trailing: Switch(value: true,onChanged: (value){},),
      //               ),
      //               TSettingsMenuTile(
      //                 icon: Iconsax.security_user,
      //                 title: 'Safe Mode',
      //                 subTitle: 'Search result is safe for all ages',
      //                 trailing: Switch(value: false,onChanged: (value){},),
      //               ),
      //               TSettingsMenuTile(
      //                 icon: Iconsax.image,
      //                 title: 'HD Image Quality',
      //                 subTitle: 'Set image quality to be seen',
      //                 trailing: Switch(value: false,onChanged: (value){},),
      //               ),
      //
      //               ///Logout Button
      //               const SizedBox(height: TSizes.spaceBtwSections,),
      //               SizedBox(
      //                 width: double.infinity,
      //                 child: OutlinedButton(onPressed: (){},child: const Text('Logout'),),
      //               ),
      //               const SizedBox(height: TSizes.spaceBtwSections * 2.5,),
      //
      //             ],
      //
      //           ),
      //       )
      //     ],
      //   ),
      // ),

      // body: Container(color: Colors.yellow,),

      backgroundColor: const Color(0xFFEAE7DC),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      AssetImage('assets/images/profile_images/chef_2.jpeg'),
                ),
              ),
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  'Chowdhury Amanullah',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFE85A4F),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Center(
                child: Text(
                  '@amanullah',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF616161),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star, color: Colors.amber),
                    SizedBox(width: 4),
                    Text(
                      '4.67',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 8),
              const Center(
                child: Text(
                  'A 48-year old veteran chef',
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () => Get.to(() => const ProfileScreen()),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'assets/images/profile_images/profile-svgrepo-com.svg',
                          color: const Color(0xFFE85A4F),
                          height: 48,
                          width: 48,
                        ),
                        const SizedBox(height: 8),
                        const Text('View/Edit Profile'),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () async => auth.logout(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'assets/images/profile_images/bookmark-svgrepo-com.svg',
                          color: const Color(0xFFE85A4F),
                          height: 48,
                          width: 48,
                        ),
                        const SizedBox(height: 8),
                        const Text('Bookmarks'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xFFE85A4F),
                    radius: 60,
                    child: CircleAvatar(
                      backgroundColor: Color(0xFFEAE7DC),
                      radius: 50,
                      child: CircleAvatar(
                        backgroundColor: Color(0xFFE85A4F),
                        radius: 43,
                        child: Center(
                          child: Text(
                            '25\nRecipes',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFEAE7DC),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Color(0xFFE85A4F),
                    radius: 60,
                    child: CircleAvatar(
                      backgroundColor: Color(0xFFEAE7DC),
                      radius: 50,
                      child: CircleAvatar(
                        backgroundColor: Color(0xFFE85A4F),
                        radius: 43,
                        child: Center(
                          child: Text(
                            '10\nBlogs',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFEAE7DC),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              Row(
                children: [
                  const Text(
                    'Your Recipes',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () => Get.to(() => const AddProcedureScreen()),
                    child: const Text(
                      '+ Add New',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFE85A4F),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 640,
                child: GridView.count(
                  crossAxisCount: 2, // 2 columns
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.57,
                  children: const [
                    RecipeCard(
                      title: 'Smashed Burger',
                      imagePath: 'assets/images/profile_images/bburger_1.jpeg',
                      rating: 4.97,
                      servingTime: '45 mins',
                    ),
                    RecipeCard(
                      title: 'Smashed Burger',
                      imagePath: 'assets/images/profile_images/bburger_1.jpeg',
                      rating: 4.97,
                      servingTime: '45 mins',
                    ),
                    RecipeCard(
                      title: 'Smashed Burger',
                      imagePath: 'assets/images/profile_images/bburger_1.jpeg',
                      rating: 4.97,
                      servingTime: '45 mins',
                    ),
                    RecipeCard(
                      title: 'Smashed Burger',
                      imagePath: 'assets/images/profile_images/bburger_1.jpeg',
                      rating: 4.97,
                      servingTime: '45 mins',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
                child: Center(
                  child: Text('See More',
                      style: TextStyle(color: Color(0xFFE85A4F))),
                ),
              ),
              const SizedBox(height: 40),
              const Row(
                children: [
                  Text(
                    'Your Blogs',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '+ Add New',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFE85A4F),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 390, // Adjust this height as needed
                child: ListView(
                  children: const [
                    BlogCard(
                      title: 'Gourmet: Hit or Miss?',
                      imagePath: 'assets/images/profile_images/chef_2.jpeg',
                      description:
                          'This blog is all about gourmet foods. Preparing them can often be a challenge. It is either a hit or a miss. Have you ever wondered what makes your dish a hit?',
                    ),
                    BlogCard(
                      title: 'Gourmet: Hit or Miss?',
                      imagePath: 'assets/images/profile_images/chef_2.jpeg',
                      description:
                          'This blog is all about gourmet foods. Preparing them can often be a challenge. It is either a hit or a miss. Have you ever wondered what makes your dish a hit?',
                    ),
                    BlogCard(
                      title: 'Gourmet: Hit or Miss?',
                      imagePath: 'assets/images/profile_images/chef_2.jpeg',
                      description:
                          'This blog is all about gourmet foods. Preparing them can often be a challenge. It is either a hit or a miss. Have you ever wondered what makes your dish a hit?',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
                child: Center(
                  child: Text('See More',
                      style: TextStyle(color: Color(0xFFE85A4F))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final double rating;
  final String servingTime;

  const RecipeCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.rating,
    required this.servingTime,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle the tap event here
        // For example, you can navigate to a detail page
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => RecipeDetailPage(title: title)),
        );
      },
      child: Container(
        height: 280,
        width: 150,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  imagePath,
                  height: 140,
                  width: 125,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        rating.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.access_time, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        servingTime,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlogCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String description;

  const BlogCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 100,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(
                8.0), // Added padding between the outer rectangle and the image
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Expanded(
                    child: Text(
                      description,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey[600],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Read More',
                    style: TextStyle(
                      fontSize: 10,
                      color: Color(0xFFE85A4F),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RecipeDetailPage extends StatelessWidget {
  final String title;

  const RecipeDetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('Detail page for $title'),
      ),
    );
  }
}
