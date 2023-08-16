import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_prod_test/ui/pages/home/components/repos_details_component.dart';
import 'package:my_prod_test/ui/pages/home/components/tab_bar_component.dart';
import 'package:my_prod_test/ui/pages/home/components/user_profile_info_component.dart';

import 'components/search_component.dart';
import 'package:my_prod_test/ui/pages/home/presenter.dart';
import 'package:my_prod_test/ui/pages/login/presenter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const route = "/home";

  @override
  Widget build(BuildContext context) {
    final loginPresenter = Get.find<ILoginPresenter>();
    final homePresenter = Get.find<IHomePresenter>();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onTertiary,
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Theme.of(context).colorScheme.onTertiary,
          ),
        ),
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
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).colorScheme.onPrimary),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          const UserProfileInfoComponent(),
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: FutureBuilder(
                future:
                    homePresenter.getStarredRepos(loginPresenter.user!.login!),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Column(
                      children: [CircularProgressIndicator()],
                    );
                  }
                  if (snapshot.hasError || snapshot.data == null) {
                    return Text(
                      "Error getting repositories",
                      style: Theme.of(context).textTheme.bodyMedium,
                    );
                  }
                  homePresenter.starredReposList = snapshot.data ?? [];
                  return Column(
                    children: [
                      Obx(() {
                        return Column(
                          children: [
                            TabBar(
                              padding: const EdgeInsets.all(0),
                              onTap: (value) {
                                homePresenter.currentIndexTab = value;
                              },
                              indicatorColor:
                                  Theme.of(context).colorScheme.outline,
                              indicatorWeight: 4,
                              tabs: [
                                Tab(
                                  child: TabBarComponent(
                                    "Repos",
                                    homePresenter.currentIndexTab == 0,
                                    "${loginPresenter.user?.publicRepos ?? 0}",
                                  ),
                                ),
                                Tab(
                                  child: TabBarComponent(
                                    "Starred",
                                    homePresenter.currentIndexTab == 1,
                                    "${homePresenter.starredReposList!.length}",
                                  ),
                                ),
                              ],
                            ),
                            const Divider(height: 0, thickness: 2)
                          ],
                        );
                      }),
                      const SearchComponent(),
                      Obx(
                        () {
                          return homePresenter.currentIndexTab == 0
                              ? FutureBuilder(
                                  future: homePresenter
                                      .getAllRepos(loginPresenter.user!.login!),
                                  builder: (context, reposSnap) {
                                    if (reposSnap.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Column(
                                        children: [CircularProgressIndicator()],
                                      );
                                    }
                                    if (reposSnap.data != null &&
                                        reposSnap.hasData) {
                                      homePresenter.repositoryList =
                                          reposSnap.data ?? [];
                                      return ReposDetailsComponent(
                                        isStarred: false,
                                        reposList: homePresenter.repositoryList!
                                            .where(
                                              (repos) => repos!.fullName!
                                                  .toLowerCase()
                                                  .contains(
                                                    homePresenter.filter,
                                                  ),
                                            )
                                            .toList(),
                                      );
                                    }
                                    return const Text("Unexpected error");
                                  },
                                )
                              : ReposDetailsComponent(
                                  isStarred: true,
                                  reposList: homePresenter.starredReposList!
                                      .where(
                                        (repos) => repos!.fullName!
                                            .toLowerCase()
                                            .contains(homePresenter.filter),
                                      )
                                      .toList(),
                                );
                        },
                      )
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
