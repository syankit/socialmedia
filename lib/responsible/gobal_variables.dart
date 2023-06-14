import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_app/screen/add_post_screen.dart';
import 'package:health_app/screen/feed_screen.dart';
import 'package:health_app/screen/profile_screen.dart';
import 'package:health_app/screen/search_screen.dart';

const webscreen = 600;

List<Widget> homeScreenItems = [
  const FeedScreen(),
  const SearchScreen(),
  const AddPostScreen(),
  const Text('notifications'),
  ProfileScreen(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];
