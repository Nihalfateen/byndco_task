import 'package:byndco/file_export.dart';

class DetailsScreenBody extends StatelessWidget {
  final String title;
  final String description;
  const DetailsScreenBody(
      {super.key, required this.description, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
      padding: EdgeInsets.only(top: 22.h, left: 18.w, right: 22.w),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(),
            ),
            SizedBox(height: 50.h),
            Text(
              description,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(color: AppColors.primaryBlue),
            ),
          ]),
    ));
  }
}
