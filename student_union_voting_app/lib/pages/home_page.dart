import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late File _image = File('lib/images/user.png');

  // sign user out method
  void signUserOut(BuildContext context) {
    FirebaseAuth.instance.signOut();
    Navigator.pop(context); // Close the drawer if open
  }

  // Select profile image from gallery
  Future<void> _selectImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      // Upload image to Firestore
      uploadImage();
    }
  }

  // Upload image to Firestore
  Future<void> uploadImage() async {
    final ref = FirebaseStorage.instance
        .ref()
        .child('user_profile_images')
        .child('${user.uid}.jpg');
    await ref.putFile(_image);
    final imageUrl = await ref.getDownloadURL();
    await _firestore
        .collection('userdb')
        .doc(user.uid)
        .update({'profileImageUrl': imageUrl});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () => signUserOut(context),
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection('userdb')
                .doc(user.uid)
                .get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasData) {
                var userData = snapshot.data!.data() as Map<String, dynamic>?;
                // Check if userData is not null before accessing its properties
                if (userData != null) {
                  return ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      DrawerHeader(
                        child: Container(
                          width: 5,
                          height: 5,
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: _image != true ? NetworkImage(userData['profileImageUrl'])
                                : AssetImage(
                                        'lib/images/user.png')
                                    as ImageProvider,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text('${user.email}'),
                      ),
                      ListTile(
                        title: Text('${userData['username']}'),
                      ),
                      ListTile(
                        title: Text('${userData['department']}'),
                      ),
                      ListTile(
                        title: const Text('Logout'),
                        onTap: () => signUserOut(context),
                      ),
                    ],
                  );
                }
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              return const Text('No Data');
            },
          ),
        ),
      ),
      body: Center(
        child: Text(
          'Welcome to Home Page!',
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          // Handle bottom navigation item taps
          switch (index) {
            case 0:
              // Home tapped
              // Navigate to home screen
              break;
            case 1:
              // Schedule tapped
              // Navigate to schedule screen
              break;
            case 2:
              // Activity tapped
              // Navigate to activity screen
              break;
            case 3:
              // Settings tapped
              // Navigate to settings screen
              break;
            default:
          }
        },
      ),
    );
  }
}
