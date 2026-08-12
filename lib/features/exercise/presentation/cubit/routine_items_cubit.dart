import 'package:fisiomate/core/errors/failure.dart';
import 'package:fisiomate/features/exercise/domain/repositories/_repositories.dart';
import 'package:fisiomate/features/exercise/presentation/cubit/routine_items_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoutineItemsCubit extends Cubit<RoutineItemsState> {
  final ExerciseRepository repository;

  RoutineItemsCubit({required this.repository})
    : super(const RoutineItemsState.initial());

  Future<void> fetch() async {
    emit(const RoutineItemsState.loading());
    try {
      final items = await repository.getRoutineItems();
      emit(RoutineItemsState.loaded(items));
    } on Failure catch (failure) {
      emit(RoutineItemsState.failure(failure.message));
    }
  }
}
