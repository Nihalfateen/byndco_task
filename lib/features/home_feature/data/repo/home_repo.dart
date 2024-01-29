import '../../../../common/models/failure_model.dart';
import '../datasources/home_datasource.dart';
import '../models/items_model/items_model.dart';

class HomeRepo {
  final HomeDataSource _homeDataSource;

  HomeRepo(this._homeDataSource);

  Future<ItemsModel> getItems(int page) async {
    try {
      var response = await _homeDataSource.getItems(page);
      var itemModel = ItemsModel.fromMap(response);
      return itemModel;
    } on FailureModel {
      rethrow;
    } catch (e) {
      throw FailureModel(state: 0, message: e.toString(), data: e.toString());
    }
  }
}
