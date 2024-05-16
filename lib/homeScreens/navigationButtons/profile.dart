import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trade_bazar/authentication/firstPage.dart';
import 'package:trade_bazar/colors.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  ThemeData _lightTheme =
      ThemeData(brightness: Brightness.light, primaryColor: Colors.blue);

  ThemeData _darkTheme =
      ThemeData(brightness: Brightness.dark, primaryColor: Colors.amber);
  bool _light = true;

  ///image selection and take final image from gallery to _image
  Uint8List? _image;

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
    saveprofile();
  }

  ///image saving in the firebase
  void saveprofile() async{
    String rep = await storeData().saveData(file: _image!);
  }



  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  var _name = "";
  var _email = "";
  String profileImageUrl = "";

  @override
  void initState() {
    super.initState();
    fetchProfileImage();
    firebaseFirestore.collection("client").doc(user!.uid).get().then((value) {
      setState(() {
        _email = value.data()!["email"];
        _name = value.data()!["name"];
      });
    });
  }

  Future<void> fetchProfileImage() async {
    try {
      DocumentSnapshot documentSnapshot = await firebaseFirestore.collection("client").doc(user!.uid).get();

      if (documentSnapshot.exists) {
        Map<String, dynamic>? userData = documentSnapshot.data() as Map<String, dynamic>?;

        if (userData != null) {
          if (userData.containsKey('profileImage')) {
            setState(() {
              profileImageUrl = userData['profileImage'];
            });
          } else {
            // If profile image URL doesn't exist, use a default image or placeholder
            // For example:
            profileImageUrl = 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png';
          }
        }
      } else {
        // Document for the user doesn't exist, handle appropriately
        // For example, display an error message or redirect to a login page
      }
    } catch (error) {
      // Handle errors
      print("Error fetching profile image: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _light ? _lightTheme : _darkTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile",
          ),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              _profileImgEdit(),
              SizedBox(
                height: 6,
              ),
              _textAndEmail(),
              SizedBox(
                height: 20,
              ),
              _generalSetting(),
              SizedBox(
                height: 25,
              ),
              _generalButtons(),
              SizedBox(
                height: 20,
              ),
              _information(),
              SizedBox(
                height: 20,
              ),
              _informationButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileImgEdit() {
    return Container(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 2.7),
      child: Stack(
        children: [

          profileImageUrl != null && profileImageUrl!.isNotEmpty
              ? Container(
                  //color: Colors.grey,
                  padding: EdgeInsets.only(left: 200),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      border: Border.all(width: 4, color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1))
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(profileImageUrl), fit: BoxFit.contain)),
                )
              : Container(
                  //color: Colors.grey,
                  padding: EdgeInsets.only(left: 200),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      border: Border.all(width: 4, color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1))
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
                          fit: BoxFit.contain)),
                ),
          Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    color: pcolor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 3)),
                child: IconButton(
                    onPressed: () {
                      selectImage();
                    },
                    icon: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 15,
                    )),
              )),
        ],
      ),
    );
  }

  // selection of profileimage an this function is called from top
  pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: source);
    if (_file != null) {
      return await _file.readAsBytes();
    }
    print("no image selected");
  }

  Widget _textAndEmail() {
    return Container(
      padding: EdgeInsets.only(left: 100, right: 100),
      //color: Colors.grey,
      child: Column(
        children: [
          Text(
            _name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            _email,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: profileTextcolor),
          )
        ],
      ),
    );
  }

  Widget _generalSetting() {
    return Container(
      padding: EdgeInsets.only(left: 30, top: 5, bottom: 5),
      color: darkWhite,
      height: 35,
      width: MediaQuery.of(context).size.width,
      child: Text(
        "General Settings",
        style: TextStyle(color: Colors.grey, fontSize: 22),
      ),
    );
  }

  Widget _generalButtons() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          //design all three general buttons
          //dark mode
          Row(
            children: [
              Icon(Icons.brightness_4_sharp, size: 27),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mode",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: profileTextcolor),
                  ),
                  Text(
                    "Dark & Light",
                    style: TextStyle(color: Colors.grey, fontSize: 17),
                  )
                ],
              ),
              SizedBox(
                width: 150,
              ),
              Switch(
                  value: _light,
                  onChanged: (state) {
                    setState(() {
                      _light = state;
                    });
                  })
            ],
          ),
          SizedBox(
            height: 15,
          ),
          //my plans
          Row(
            children: [
              Icon(Icons.key_sharp, size: 27),
              SizedBox(
                width: 15,
              ),
              Text(
                "My Plans",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: profileTextcolor),
              ),
              SizedBox(
                width: 200,
              ),
              Icon(
                Icons.keyboard_arrow_right,
                color: profileTextcolor,
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          //language
          Row(
            children: [
              Icon(Icons.book, size: 27),
              SizedBox(
                width: 15,
              ),
              Text(
                "Language",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: profileTextcolor),
              ),
              SizedBox(
                width: 194,
              ),
              Icon(
                Icons.keyboard_arrow_right,
                color: profileTextcolor,
              )
            ],
          ),
          //logout
          SizedBox(
            height: 10,
          ),
          //language
          Row(
            children: [
              Icon(Icons.logout, size: 27),
              SizedBox(
                width: 15,
              ),
              Text(
                "Log Out",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: profileTextcolor),
              ),
              SizedBox(
                width: 195,
              ),
              IconButton(
                  onPressed: () {
                    logout(context);
                  },
                  icon: Icon(
                    Icons.keyboard_arrow_right,
                    color: profileTextcolor,
                  ))
            ],
          )
        ],
      ),
    );
  }

  Widget _information() {
    return Container(
      padding: EdgeInsets.only(left: 30, top: 5, bottom: 5),
      color: darkWhite,
      height: 35,
      width: MediaQuery.of(context).size.width,
      child: Text(
        "Information",
        style: TextStyle(color: Colors.grey, fontSize: 22),
      ),
    );
  }

  Widget _informationButton() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          //design all four general buttons
          SizedBox(
            height: 10,
          ),
          //About phone
          Row(
            children: [
              Icon(Icons.phone_android, size: 27),
              SizedBox(
                width: 15,
              ),
              Text(
                "About App",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: profileTextcolor),
              ),
              SizedBox(
                width: 190,
              ),
              Icon(
                Icons.keyboard_arrow_right,
                color: profileTextcolor,
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          //Terms & Conditions
          Row(
            children: [
              Icon(Icons.file_copy_outlined, size: 27),
              SizedBox(
                width: 15,
              ),
              Text(
                "Terms & Conditions",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: profileTextcolor),
              ),
              SizedBox(
                width: 117,
              ),
              Icon(
                Icons.keyboard_arrow_right,
                color: profileTextcolor,
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          //Privacy Policy
          Row(
            children: [
              Icon(Icons.policy_sharp, size: 27),
              SizedBox(
                width: 15,
              ),
              Text(
                "Privacy Policy",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: profileTextcolor),
              ),
              SizedBox(
                width: 162,
              ),
              Icon(
                Icons.keyboard_arrow_right,
                color: profileTextcolor,
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          //share this app
          Row(
            children: [
              Icon(Icons.share, size: 27),
              SizedBox(
                width: 15,
              ),
              Text(
                "Share This App",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: profileTextcolor),
              ),
              SizedBox(
                width: 151,
              ),
              Icon(
                Icons.keyboard_arrow_right,
                color: profileTextcolor,
              )
            ],
          )
        ],
      ),
    );
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => firstPage1()));
  }


}

///post image saving part
final _auth = FirebaseAuth.instance;
final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
User? user = _auth.currentUser;

class storeData   {

  Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    Reference ref = _storage.ref().child(childName);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();

    return downloadUrl;
  }

  Future<String> saveData({
    required Uint8List file, // we can other file also from her
  }) async {
    String rep = "Some error Occurred";
    try {
      String imageUrl = await uploadImageToStorage('profileImage', file);
      await _firestore.collection("client").doc(user?.uid).set({
        "profileImage": imageUrl,
      },SetOptions(merge: true));
      rep = "success";
    } catch (err) {
      rep = err.toString();
    }
    return rep;
  }
}
