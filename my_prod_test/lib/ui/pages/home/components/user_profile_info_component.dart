import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../login/presenter.dart';

class UserProfileInfoComponent extends StatelessWidget {
  const UserProfileInfoComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final loginPresenter = Get.find<ILoginPresenter>();
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(color: Theme.of(context).colorScheme.secondary)
              ],
            ),
            child: loginPresenter.user?.avatarUrl == null
                ? Image.asset(
                    "lib/assets/git_logo.png",
                    height: 80,
                    width: 80,
                  )
                : Image(
                    image: NetworkImage(
                      loginPresenter.user!.avatarUrl!,
                    ),
                    height: 80,
                    width: 80,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return ClipRRect(child: child);
                      }
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80),
                        ),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  loginPresenter.user!.name!,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.62,
                  child: Text(
                    loginPresenter.user!.bio ?? "",
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
