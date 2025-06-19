import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawel/presentation/bloc/events/categories.dart';
import 'package:nawel/presentation/bloc/state/categories.dart';
import 'package:nawel/domain/usecases/get_services_usecase.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final GetCategoriesUseCase getCategoriesUseCase;

  CategoriesBloc(this.getCategoriesUseCase) : super(const CategoriesState()) {
    on<FetchCategories>(_onFetchCategories);
  }

  Future<void> _onFetchCategories(
    FetchCategories event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final categories = await getCategoriesUseCase();
      emit(state.copyWith(isLoading: false, categories: categories));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
