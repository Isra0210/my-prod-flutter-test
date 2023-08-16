import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../main/models/repos_model.dart';

class ReposDetailsComponent extends StatelessWidget {
  const ReposDetailsComponent({
    required this.reposList,
    required this.isStarred,
    super.key,
  });

  final List<ReposModel?> reposList;
  final bool isStarred;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => Divider(
          color: Theme.of(context).colorScheme.onPrimary,
          thickness: 2,
        ),
        itemCount: reposList.length,
        itemBuilder: (context, index) {
          final repos = reposList[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26.0),
            child: Column(
              children: [
                Column(
                  children: [
                    Text(
                      repos?.fullName ?? "",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.blue, fontSize: 18),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        repos?.description ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontSize: 12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          isStarred
                              ? Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      size: 15,
                                    ),
                                    Text(
                                      "${repos!.stargazersCount}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(fontSize: 12),
                                    ),
                                  ],
                                )
                              : Row(
                                  children: [
                                    Icon(
                                      Icons.code,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      size: 15,
                                    ),
                                    Text(
                                      "${repos!.language}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(fontSize: 12),
                                    ),
                                  ],
                                ),
                          const SizedBox(
                            width: 8,
                          ),
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.codeFork,
                                color: Theme.of(context).colorScheme.primary,
                                size: 15,
                              ),
                              Text(
                                "${repos.forkCount}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
