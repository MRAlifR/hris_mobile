// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

// Dart imports:
import 'dart:async';
import 'dart:developer';

// Flutter imports:
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Project imports:
import 'package:hris_mobile/app/app.dart';
import 'package:hris_mobile/app/app_bloc_observer.dart';
import 'package:hris_mobile/modules/attendance/data/data_source/attendance_local_source.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  Bloc.observer = AppBlocObserver();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(
    AttendanceLocalSource.attendanceLocalKey,
  );

  runZonedGuarded(
    () => runApp(App(odooURL: 'http://192.168.43.67:8067')),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
