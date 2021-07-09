// Package imports:
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:hris_mobile/core/extension/extension.dart';

part 'month_selection_state.dart';
part 'month_selection_cubit.freezed.dart';

class MonthSelectionCubit extends Cubit<MonthSelectionState> {
  MonthSelectionCubit() : super(MonthSelectionState(DateTime.now()));

  void increaseMonth() {
    emit(MonthSelectionState(state.dateTime.plus(month: 1)));
  }

  void decreaaseMonth() {
    emit(MonthSelectionState(state.dateTime.minus(month: 1)));
  }
}
