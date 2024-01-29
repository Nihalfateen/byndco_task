import '../../../../common/models/failure_model.dart';
import '../../../../core/constants/app_urls.dart';
import '../../../../core/services/dio_services.dart';

class HomeDataSource {
  final DioServices _dioServices;

  HomeDataSource(this._dioServices);

  Future<Map<String, dynamic>> getItems(int page) async {
    try {
      var response = await _dioServices
          .getRequest(AppUrl.getImages, parms: {"offset": page});
      return response;
    } on FailureModel {
      rethrow;
    } catch (e) {
      throw FailureModel(state: 0, message: e.toString(), data: e.toString());
    }
  }
}
