import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hostel_management_app/controller/authentication/owner_controller.dart';
import 'package:hostel_management_app/model/owner_model.dart';

class AuthenticationRepository extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late UserCredential userCredential;
  final OwnerController owner = OwnerController();

//Login

// sign up
  Future<String?> signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    try {
      userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final newOwner = OwnerModel(
          id: userCredential.user!.uid,
          hostelName: '',
          emailAddress: email,
          mobileNumber: '',
          ownwerName: name,
          profilePictuer: '',
          noOfRoomsInFloors: []);

      //saving owner data
      await owner.saveOwnerRecords(newOwner);
      // You might perform additional actions here upon successful sign-up
      return null; // Return null for successful sign-up
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
      return e.message; // Return error message for other exceptions
    } catch (e) {
      return 'Error: ${e.toString()}'; // Return generic error message for other exceptions
    }
  }
}
