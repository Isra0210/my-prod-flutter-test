import 'package:get/get.dart';
import 'package:my_prod_test/main/models/repos_model.dart';

import '../../main/repository/git_user_repos_repository.dart';
import '../../ui/pages/home/presenter.dart';

class GetXHomePresenter extends GetxController implements IHomePresenter {
  final GitUserReposRepository repository = GitUserReposRepository();
  
  final RxInt _currentIndexTab = 0.obs;
  @override
  int get currentIndexTab => _currentIndexTab.value;
  @override
  set currentIndexTab(int value) => _currentIndexTab.value = value;
  
  final RxString _filter = "".obs;
  @override
  String get filter => _filter.value;
  @override
  set filter(String value) => _filter.value = value;

  final RxList<ReposModel?> _starredReposList = <ReposModel?>[].obs;
  @override
  List<ReposModel?>? get starredReposList => _starredReposList;
  @override
  set starredReposList(List<ReposModel?>? value) =>
      _starredReposList.value = value ?? [];

  final RxList<ReposModel?> _repositoryList = <ReposModel?>[].obs;
  @override
  List<ReposModel?>? get repositoryList => _repositoryList;
  @override
  set repositoryList(List<ReposModel?>? value) =>
      _repositoryList.value = value ?? [];

  @override
  Future<List<ReposModel?>?> getAllRepos(String userName) async {
    return repository.getAllRepos(userName);
  }

  @override
  Future<List<ReposModel?>?> getStarredRepos(String userName) async {
    return repository.getStarredRepos(userName);
  }
}
