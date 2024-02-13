
import 'package:isar/isar.dart';
import 'package:lead_do_it_test/local_data_base/favorite_repos_model.dart';
import 'package:path_provider/path_provider.dart';


class DataBaseService {
  late Isar isar;
  DataBaseService._internal();

  static final DataBaseService _singleton = DataBaseService._internal();
  static  DataBaseService get instance => _singleton;

//// init

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([FavoriteReposSchema], directory: dir.path);
  }

////write

  Future<void> addFavoriteRepos (FavoriteRepos repository) async {
    final newRepos = FavoriteRepos()..id=repository.id..name=repository.name;
    await isar.writeTxn(() => isar.favoriteRepos.put(newRepos));
  }


//// read
  List<FavoriteRepos> currentList = [];

  Future<List<FavoriteRepos>> fetchFavoriteRepos() async{
    List<FavoriteRepos> favoriteRepos= await isar.favoriteRepos.where().findAll();
    currentList.clear();
    currentList.addAll(favoriteRepos);
    return favoriteRepos;
  }


//// remove

  Future<void> removeRepos (int id) async {
    await isar.writeTxn(() async {
      await isar.favoriteRepos.delete(id);// delete
      await fetchFavoriteRepos();
    });
  }

//// getFavoriteOrNOT

  Future<bool> isReposFavorite (int id) async {
    final repository = await isar.favoriteRepos.where().idEqualTo(id).findFirst();
    return repository != null;
  }

}