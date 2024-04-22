import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_buddy/models/post.dart';

class PostProvider with ChangeNotifier {
  List<Post> _posts = [];

  List<Post> get posts {
    return [..._posts];
  }

  Future<void> addPost(Post post) async {
    await FirebaseFirestore.instance.collection('posts').add({
      'origin': post.origin,
      'destination': post.destination,
      'travelDate': post.travelDate,
      'availableWeight': post.availableWeight,
    });
    _posts.add(post);
    notifyListeners();
  }

  Future<void> fetchPosts() async {
    final dataList = await FirebaseFirestore.instance.collection('posts').get();
    _posts = dataList.docs.map((doc) => Post.fromFirestore(doc)).toList();
    notifyListeners();
  }
}
