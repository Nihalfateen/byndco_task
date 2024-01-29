import 'package:byndco/features/home_feature/data/repo/home_repo.dart';
import 'package:byndco/features/home_feature/domain/home_controller.dart';
import 'package:byndco/features/home_feature/domain/home_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/locator_services.dart';

final homeProvider = StateNotifierProvider<HomeController, HomeState>(
    (ref) => HomeController(locator<HomeRepo>()));
