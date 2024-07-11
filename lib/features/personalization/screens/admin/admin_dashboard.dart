import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/personalization/screens/admin/widgets/pending_blog.dart';
import 'package:t_store/features/personalization/screens/admin/widgets/pending_recipe.dart';

import '../../../../utils/constants/colors.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthenticationRepository.instance;
    return Scaffold(
      backgroundColor: const Color(0xFFEAE7DC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEAE7DC),
        title: const Text(
          'Admin Dashboard',
          style: TextStyle(
            color: Color(0xFFE85A4F),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    TextButton(
                      onPressed: () => Get.to(() => const AdminPendingRecipeList()),
                      child: const TaskCard(
                        task: 'Pending Recipe Approvals',
                        icon: Icons.approval,
                      ),
                    ),
                    TextButton(
                      onPressed: () => Get.to(() => const AdminPendingBlogList()),
                      child: TaskCard(
                        task: 'Pending Blog Approvals',
                        icon: Icons.pending,
                      ),
                    ),
                    TaskCard(
                      task: 'Manage Recipes',
                      icon: Icons.spoke_outlined,
                    ),
                    TaskCard(
                      task: 'Manage Blogs',
                      icon: Icons.newspaper,
                    ),
                    TaskCard(
                      task: 'Manage Users',
                      icon: Icons.supervised_user_circle,
                    ),
                    TaskCard(
                      task: 'Manage Ingredients',
                      icon: Icons.egg,
                    ),
                    const SizedBox(height: 16,),
                    SizedBox(
                      width: 180,
                      child: ElevatedButton(
                        onPressed: () => auth.logout(),
                          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFE85A4F)),
                          child: const Text("Log Out", style: TextStyle(color: TColors.dark),)
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final String task;
  final IconData icon;

  const TaskCard({
    super.key,
    required this.task,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 70,
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
        mainAxisAlignment:
        MainAxisAlignment.center, // Center the content horizontally
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              icon,
              size: 55,
              color: const Color(0xFFE85A4F),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.center, // Center the content vertically
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task,
                    style: const TextStyle(
                      fontSize: 16,
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
