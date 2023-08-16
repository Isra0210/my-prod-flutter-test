import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future showSnackbar({
  required String title,
  required BuildContext context,
}) async {
  Get.snackbar(
    title,
    '',
    padding: const EdgeInsets.only(left: 16, top: 16),
    snackStyle: SnackStyle.GROUNDED,
    colorText: Theme.of(context).colorScheme.onBackground,
    dismissDirection: DismissDirection.vertical,
    titleText: Text(
      title,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
    ),
    margin: const EdgeInsets.all(0),
    maxWidth: double.infinity,
    borderRadius: 0,
    backgroundColor: Theme.of(context).colorScheme.tertiary,
  );
}
