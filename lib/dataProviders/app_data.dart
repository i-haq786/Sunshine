import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:sunshine/models/usermodel.dart';

class AppData extends ChangeNotifier {
  List<String> selectedGoals = [];
  String name = '';
  DateTime? time;
  String venue = '';
  User? user;
  UserModel? crush;
  UserModel? userModel;
  void updateUserModel(UserModel userModel) {
    this.userModel = userModel;
    notifyListeners();
  }

  void updateCrush(UserModel userModel) {
    this.crush = userModel;
    notifyListeners();
  }

  void updateUser(User user) {
    this.user = user;
    notifyListeners();
  }

  void updateGoals(List<String> selectedGoals) {
    this.selectedGoals = selectedGoals;
    notifyListeners();
  }

  void updateName(String name) {
    this.name = name;
    notifyListeners();
  }

  void updateTimeVenue({required DateTime time, required String venue}) {
    this.time = time;
    this.venue = venue;
    notifyListeners();
  }
}
