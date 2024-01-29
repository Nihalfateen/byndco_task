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
    final homeState = ref.watch(homeProvider);
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
        ),
        SliverPersistentHeader(
          delegate: MySliverPersistentHeaderDelegate(),
          floating: false,
        ),
        if (homeState is HomeLoading)
          const SliverToBoxAdapter(child: LoadingWidget())
        else if (homeState is HomeError)
          SliverToBoxAdapter(
              child: Text(
            homeState.errorMessage,
            style: Theme.of(context).textTheme.displayMedium,
          ))
        else if (homeState is HomeDone)
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ItemCardWidget(
                  itemPhotoModel: home.itemsModel!.listOfPhoto![index]),
              childCount: home.itemsModel!.listOfPhoto!.length,
            ),
          )
      ],
    ));
  }
}
