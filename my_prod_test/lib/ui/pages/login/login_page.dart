import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_prod_test/main/models/user_model.dart';
import 'package:my_prod_test/ui/pages/home/home_page.dart';
import 'package:my_prod_test/ui/utils/hide_loading.dart';
import 'package:my_prod_test/ui/utils/show_loading.dart';
import 'package:my_prod_test/ui/utils/snack_bar.dart';

import 'presenter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const route = "/";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final presenter = Get.find<ILoginPresenter>();
  final TextEditingController _fieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.onTertiary,
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        elevation: 0,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "lib/assets/github-mark-white.png",
                height: MediaQuery.of(context).size.height * 0.04,
              ),
            ),
            Text(
              "Github",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onPrimary),
            ),
            const SizedBox(width: 4),
            Text(
              "profiles",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: 40,
          width: MediaQuery.of(context).size.width * 0.9,
          margin: const EdgeInsets.all(8),
          child: Obx(() {
            return TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color?>(
                  presenter.findUser.trim().isEmpty
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.tertiary,
                ),
                shape: MaterialStateProperty.all<OutlinedBorder?>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              onPressed: presenter.findUser.trim().isEmpty
                  ? null
                  : () async {
                      showLoading(context);
                      final response = await presenter.getUserInfo();

                      if (mounted) {
                        hideLoading(context);
                        if (response["error"] != null) {
                          showSnackbar(
                              title: response["error"], context: context);
                        }
                        if (response["data"] is UserModel) {
                          _fieldController.text = "";
                          presenter.user = response["data"];
                          Get.toNamed(HomePage.route);
                        }
                      }
                    },
              child: Text(
                "Search",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: presenter.findUser.trim().isEmpty
                        ? Theme.of(context).colorScheme.surface
                        : Theme.of(context).colorScheme.onPrimary),
              ),
            );
          }),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
        child: TextFormField(
          controller: _fieldController,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Theme.of(context).colorScheme.tertiary),
          decoration: InputDecoration(
            labelText: "Search user",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onChanged: (String? value) {
            presenter.findUser = value ?? "";
          },
        ),
      ),
    );
  }
}
