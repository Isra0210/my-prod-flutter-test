import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_prod_test/ui/pages/home/presenter.dart';

class SearchComponent extends StatelessWidget {
  const SearchComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Get.find<IHomePresenter>();
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: TextField(
        onChanged: (String? value) {
          presenter.filter = value ?? "";
        },
        style: Theme.of(context).textTheme.bodySmall!,
        decoration: InputDecoration(
          prefix: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Icon(
              size: 16,
              Icons.search,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          labelText: "Filter by name",
          labelStyle: Theme.of(context).textTheme.bodySmall!,
          contentPadding: const EdgeInsets.only(left: 8, bottom: 8),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
