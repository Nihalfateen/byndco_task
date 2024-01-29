import 'package:byndco/features/home_feature/views/details_screen/details_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../common/widgets/rounded_cached_image.dart';
import '../../../../../core/config/providers.dart';
import '../../../../../file_export.dart';
import '../../../data/models/items_model/items_photos_model.dart';

class ItemCardWidget extends ConsumerWidget {
  const ItemCardWidget({super.key, required this.itemPhotoModel});
  final ItemPhotoModel itemPhotoModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final home = ref.watch(homeProvider.notifier);

    return InkWell(
      onTap: () {
        home.selectedItem = itemPhotoModel;
        GoRouter.of(context).goNamed(DetailsScreen.route);
      },
      child: Container(
        padding:
            EdgeInsets.only(left: 27.w, right: 22.w, bottom: 21.h, top: 25.h),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 100.h,
              width: ScreenUtil().screenWidth / 3,
              child: RoundedCachedImage(
                  url: itemPhotoModel.imageUrl,
                  boxFit: BoxFit.contain,
                  curve: 8),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(itemPhotoModel.title!,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontSize: 16.sp),
                      textAlign: TextAlign.center),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(itemPhotoModel.description!,
                      style: Theme.of(context).textTheme.displaySmall,
                      textAlign: TextAlign.center),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
