import 'package:fisiomate/features/exercise/domain/entities/routine_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'routine_items_state.freezed.dart';

@freezed
sealed class RoutineItemsState with _$RoutineItemsState {
  const factory RoutineItemsState.initial() = RoutineItemsInitial;
  const factory RoutineItemsState.loading() = RoutineItemsLoading;
  const factory RoutineItemsState.loaded(List<RoutineItem> items) =
      RoutineItemsLoaded;
  const factory RoutineItemsState.failure(String message) =
      RoutineItemsFailureState;
}
