import 'package:byndco/features/home_feature/domain/home_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/widgets/loading_widget.dart';
import '../../../../core/config/providers.dart';
import '../../../../file_export.dart';
import 'components/animtion_widget.dart';
import 'components/item_card_widget.dart';

class Home extends ConsumerStatefulWidget {
  static const route = "/HomeScreen";

  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  void initState() {
    super.initState();
    Future(() {
      ref.read(homeProvider.notifier).getItems();
      ref.read(homeProvider.notifier).addScrollListener();
    });
  }

  @override
  Widget build(BuildContext context) {
    final home = ref.watch(homeProvider.notifier);
    return Scaffold(
        body: CustomScrollView(
      controller: home.itemsScrollController,
      slivers: <Widget>[
        SliverAppBar(
          title: Text("Bynd",
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(color: AppColors.whiteColor)),
          floating: false,
          elevation: 1.2,
          backgroundColor: AppColors.primaryBlue,
          pinned: true,
          leading: IconButton(
              onPressed: () => GoRouter.of(context).pop(),
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.whiteColor,
              )),
        ),
        SliverPersistentHeader(
          delegate: MySliverPersistentHeaderDelegate(),
          floating: false,
        ),
        StreamBuilder<HomeState>(
          stream: home.stream,
          builder: (context, snapshot) {
            if (snapshot.data is HomeLoading) {
              return const SliverToBoxAdapter(child: LoadingWidget());
            } else if (snapshot.data is HomeError) {
              var error = snapshot.data as HomeError;
              return SliverToBoxAdapter(
                  child: Text(
                error.errorMessage,
                style: Theme.of(context).textTheme.displayMedium,
              ));
            }
            return snapshot.hasData
                ? SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => ItemCardWidget(
                          itemPhotoModel: home.itemsModel!.listOfPhoto![index]),
                      childCount: home.itemsModel!.listOfPhoto!.length,
                    ),
                  )
                : const SliverToBoxAdapter(child: LoadingWidget());
          },
        )
      ],
    ));
  }
}
