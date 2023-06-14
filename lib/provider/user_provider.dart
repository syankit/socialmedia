import 'package:flutter/widgets.dart';
import 'package:health_app/models/user.dart';
import 'package:health_app/resources/auth.dart';

class UserProvider with ChangeNotifier {
  //changenotifier=provide funcnality we inherite func from this
  User? _user; //private bcuz pub may cuz bug
  final Auth _authMethods = Auth();

  User get getUser => _user!;

  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners(); //notify that data of user is change so change the value
  }
}
