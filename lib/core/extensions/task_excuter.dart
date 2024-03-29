import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../common/models/failure_model.dart';
import 'task_fail_mapper.dart';

extension TaskExcuter<T> on Future<T> {
  //TODO add excute multible futures
  Future<void> excute({
    bool onlyIfConnected = false,
    Function(FailureModel failed)? onFailed,
    Function(T value)? onSuccess,
  }) async {
    return await Task(() => this).attempt().mapFailure().run().then((o) {
      return o.fold(
        (f) async {
          try {
            if (onFailed != null) await onFailed(f);
          } catch (e) {
            log(e.toString());
          }
        },
        (s) async {
          try {
            if (onSuccess != null) await onSuccess(s);
          } catch (e) {
            log(e.toString());
          }
        },
      );
    });
  }
}
