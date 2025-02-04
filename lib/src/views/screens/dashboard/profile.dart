import 'package:colab/core/utils/local_storage/shared_pref.dart';
import 'package:colab/services/routing/route_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Log Out"),
                    content: Text("Are you Sure you want to Log Out?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          context.pop();
                        },
                        child: Text("No"),
                      ),
                      TextButton(
                        onPressed: () {
                          LocalStorage.removeToken("token");

                          context.go(RoutePath.login);
                        },
                        child: Text("Yes"),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text("Profile")),
      ),
    );
  }
}
