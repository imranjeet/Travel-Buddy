import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_buddy/providers/post_provider.dart';
import 'package:travel_buddy/utils/colors.dart';
import 'package:travel_buddy/views/create_post_screen.dart';
import 'package:travel_buddy/utils/widgets/appbar.dart';
import 'package:travel_buddy/utils/widgets/primary_header_container.dart';
import 'package:travel_buddy/views/widgets/empty_widget.dart';
import 'package:travel_buddy/views/widgets/routes_list_card.dart';
import 'package:travel_buddy/views/widgets/shimmer_list_card.dart';

class PostListingScreen extends StatefulWidget {
  static const routeName = "PostListingScreen";
  const PostListingScreen({super.key});

  @override
  State<PostListingScreen> createState() => _PostListingScreenState();
}

class _PostListingScreenState extends State<PostListingScreen> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    await Provider.of<PostProvider>(context, listen: false).fetchPosts();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final posts = Provider.of<PostProvider>(context).posts;
    return Scaffold(
      body: Column(
        children: [
          PrimaryHeaderContainer(
              height: size.height * 0.17,
              child: const Column(
                children: [
                  TAppBar(
                    title: Text(
                      "Available Travel Routes",
                      style: TextStyle(
                          fontSize: 22,
                          color: AppColors.textWhite,
                          fontWeight: FontWeight.bold),
                    ),
                    centerTitle: true,
                  )
                ],
              )),
          SizedBox(
            height: size.height * 0.8,
            child: isLoading
                ? ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: 5,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return const ShimmerListViewCard();
                    })
                : posts.isEmpty
                    ? const EmptyWidget()
                    : ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: posts.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          final post = posts[index];
                          return RoutesListCard(post: post);
                        },
                      ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: const BoxDecoration(
            // borderRadius: BorderRadius.circular(20),
            shape: BoxShape.circle,
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, AppColors.appBarColor])),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, CreatePostScreen.routeName);
            },
            backgroundColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(top: 1.0),
              child: Container(
                  height: 48,
                  width: 48,
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: const Icon(Icons.add, size: 30, color: Colors.black)),
            ),
          ),
        ),
      ),
    );
  }
}
