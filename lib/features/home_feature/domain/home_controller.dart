import 'package:byndco/core/extensions/task_excuter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../file_export.dart';
import '../data/models/items_model/items_model.dart';
import '../data/models/items_model/items_photos_model.dart';
import '../data/repo/home_repo.dart';
import 'home_state.dart';

class HomeController extends StateNotifier<HomeState> {
  HomeController(this._homeRepo) : super(HomeInitial());

  final HomeRepo _homeRepo;

  ItemsModel? itemsModel;
  int pageNumber = 1;
  int? totalPages;
  bool isScrollFinished = false;
  ScrollController itemsScrollController = ScrollController();

  ItemPhotoModel? selectedItem;

  Future<void> getItems({
    bool paginated = false,
  }) async {
    if (paginated == false) {
      pageNumber = 1;
    }
    if (pageNumber == 1) {
      state = HomeLoading();
    } else {
      if (pageNumber > totalPages!) {
        return;
      }
    }
    var notification = _homeRepo.getItems(
      pageNumber,
    );
    await notification.excute(
      onFailed: (failed) => state = HomeError(failed.message!),
      onSuccess: (value) {
        if (pageNumber == 1) {
          itemsModel = value;
          var totalPagesPre = itemsModel!.totalPhotos! ~/ 10;
          totalPages = (itemsModel!.totalPhotos! % 10) == 0
              ? totalPagesPre
              : totalPagesPre + 1;
        } else {
          itemsModel!.listOfPhoto?.addAll(value.listOfPhoto!);
        }
        state = HomeDone();
      },
    );
  }

  addScrollListener() {
    itemsScrollController.addListener(() async {
      final endOfScroll = itemsScrollController.offset ==
          itemsScrollController.position.maxScrollExtent;
      if (endOfScroll && totalPages! > pageNumber) {
        pageNumber++;
        if (!isScrollFinished) {
          getItems(
            paginated: true,
          );
        }
      }
    });
  }
}
