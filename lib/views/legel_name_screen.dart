import 'package:blott_app/utils/app_image_constant.dart';
import 'package:blott_app/views/notification_screen.dart';
import 'package:blott_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/app_colors.dart';

class LegalNameScreen extends StatefulWidget {
  @override
  _LegalNameScreenState createState() => _LegalNameScreenState();
}

class _LegalNameScreenState extends State<LegalNameScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  bool isButtonEnabled() {
    return firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty;
  }

  void navigateToAllowNotifications() {
    if (isButtonEnabled()) {
      // Save first and last name to the provider
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.setFirstName(firstNameController.text);
      userProvider.setLastName(lastNameController.text);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AllowNotificationScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32),
              Text(
                'Your legal name',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'We need to know a bit about you so that we can create your account.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 32),
              TextField(
                controller: firstNameController,
                decoration: InputDecoration(
                  labelText: 'First name',
                ),
                onChanged: (text) {
                  setState(() {});
                },
              ),
              SizedBox(height: 16),
              TextField(
                controller: lastNameController,
                decoration: InputDecoration(
                  labelText: 'Last name',
                ),
                onChanged: (text) {
                  setState(() {});
                },
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: navigateToAllowNotifications,
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: isButtonEnabled() ? primaryColor : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(vector),
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
