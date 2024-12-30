// A page list current coding page
import 'package:flutter/material.dart';
import 'package:outernet/domain/entities/review_entity.dart';
import 'package:outernet/presentation/screens/discover/discover_categories.dart';
import 'package:outernet/presentation/screens/home_screen/page_selector.dart';
import 'package:outernet/presentation/screens/account_screen/login_screen.dart';
import 'package:outernet/presentation/screens/home_screen/home_screen.dart';
import 'package:outernet/presentation/screens/personal_screen/personal_account_screen.dart';
import 'package:outernet/presentation/screens/personal_screen/personal_information_screen.dart';
import 'package:outernet/presentation/screens/account_screen/register_screen.dart';
import 'package:outernet/presentation/screens/personal_screen/security_screen.dart';
import 'package:outernet/presentation/screens/site_screen/site_adding/add_new_site_screen.dart';
import 'package:outernet/presentation/ui_component_resused/review_card.dart';

class CurrentCodingPage extends StatelessWidget {
  const CurrentCodingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Current Coding'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Current Coding Page'),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the current coding page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: const Text('Login page'),
              ),
              // register screen
              ElevatedButton(
                onPressed: () {
                  // Navigate to the current coding page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                child: const Text('Register page'),
              ),
              // Home page
              ElevatedButton(
                onPressed: () {
                  // Navigate to the current coding page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PageSelector()),
                  );
                },
                child: const Text('Home page'),
              ),
              //Personal Information screen
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const PersonalInformationScreen()));
                },
                child: const Text('Personal Information'),
              ),
              // Personal account screen
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const PersonalAccountScreen()));
                },
                child: const Text('Personal Account'),
              ),
              // Security screen
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SecurityScreen()));
                },
                child: const Text('Security'),
              ),
              //Discover_categories screen
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DiscoverCategories()));
                },
                child: const Text('Discover Categories'),
              ),
              //SiteDetail screen
              ElevatedButton(
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => const SiteDetailScreen()));
                },
                child: const Text('Site Detail'),
              ),
              ElevatedButton(
                onPressed: () {
                  final review = ReviewEntity.defaultInstance;
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewCard(review: review, isFavorite: false,)));
                },
                child: const Text('Review Card'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: const Text('Home_screen'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddNewSiteScreen()));
                },
                child: const Text('add site'),
              )
            ],
          ),
        ),
      ),
    );
  }
}