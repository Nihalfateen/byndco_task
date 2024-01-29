import 'package:byndco/common/widgets/loading_widget.dart';
import 'package:byndco/file_export.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetailsScreenHeader extends StatelessWidget {
  const DetailsScreenHeader({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: ScreenUtil().screenHeight / 3,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_ios,
          color: AppColors.whiteColor,
        ),
      ),
      stretch: true,
      pinned: false,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [
          StretchMode.zoomBackground,
          StretchMode.blurBackground
        ],
        background: CachedNetworkImage(
          imageUrl: image,
          placeholder: (context, url) => const Center(child: LoadingWidget()),
          errorWidget: (context, url, error) => const Icon(Icons.broken_image),
          fit: BoxFit.cover,
        ),
      ),
    );
    ;
  }
}
