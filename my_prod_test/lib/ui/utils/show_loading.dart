import 'package:flutter/material.dart';

import '../components/loading_component.dart';

Future<void> showLoading(BuildContext context) async {
  Navigator.of(context).push(
    PageRouteBuilder(
      opaque: false,
      barrierDismissible: true,
      fullscreenDialog: true,
      pageBuilder: (BuildContext context, _, __) {
        return Container(
          color: Colors.black.withOpacity(0.4),
          child: const LoadingComponent(),
        );
      },
    ),
  );
}
