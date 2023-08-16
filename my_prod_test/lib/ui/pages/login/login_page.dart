import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const route = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.onTertiary,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "lib/assets/git_logo.png",
            height: MediaQuery.of(context).size.height * 0.12,
          ),
        ),
        elevation: 0,
        title: Text(
          "Busque um usuário do Github",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        backgroundColor: Theme.of(context).colorScheme.onTertiary,
      ),
      bottomNavigationBar: Container(
        height: 40,
        width: MediaQuery.of(context).size.width * 0.9,
        margin: const EdgeInsets.all(8.0),
        child: Obx(
           () {
            return TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color?>(
                    Theme.of(context).colorScheme.tertiary),
                shape: MaterialStateProperty.all<OutlinedBorder?>(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
              ),
              onPressed: () {},
              child: Text(
                "Buscar",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
            );
          }
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 60, 16, 0),
        child: SizedBox(
          height: 50,
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
