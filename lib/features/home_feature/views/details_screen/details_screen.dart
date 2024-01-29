import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/config/providers.dart';
import 'components/details_screen_body.dart';
import 'components/details_screen_header.dart';

class DetailsScreen extends ConsumerWidget {
  static const route = "DetailsScreen";

  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final home = ref.watch(homeProvider.notifier);

    return Scaffold(
      body: CustomScrollView(
          slivers: [
        DetailsScreenHeader(image: home.selectedItem!.imageUrl!),
        DetailsScreenBody(
          description: home.selectedItem!.description!,
          title: home.selectedItem!.title!,
        )
      ]),
    );
  }
}
