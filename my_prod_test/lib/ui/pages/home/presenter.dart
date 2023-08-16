import 'package:my_prod_test/main/models/repos_model.dart';

abstract class IHomePresenter {
  List<ReposModel?>? get repositoryList;
  set repositoryList(List<ReposModel?>? value);

  int get currentIndexTab;
  set currentIndexTab(int value);
  
  String get filter;
  set filter(String value);
  
  List<ReposModel?>? get starredReposList;
  set starredReposList(List<ReposModel?>? value);

  Future<List<ReposModel?>?> getAllRepos(String userName);
  Future<List<ReposModel?>?> getStarredRepos(String userName);
}
