import 'package:flutter/material.dart';

class MenuItem {
  final String text;
 final IconData icon;

  const MenuItem(this.text, this.icon);
}

class MenuItems {
  static const accouontDetails = MenuItem('Account Details', Icons.person);
  static const changePassword = MenuItem('Change Password',Icons.vpn_key);
  static const signOut = MenuItem('Sign Out', Icons.logout);

  static const List<MenuItem> choices = [
    accouontDetails,
    changePassword,
    signOut
  ];
}
