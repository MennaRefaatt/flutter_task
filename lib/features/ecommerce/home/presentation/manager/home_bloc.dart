import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../domain/home_entity/home_entity.dart';
import '../../domain/usecases/home_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUseCase homeUseCase;

  HomeBloc(this.homeUseCase) : super(HomeInitial()) {
    on<FetchHomeData>(_onFetchHomeData);
  }

  Future<void> _onFetchHomeData(
      FetchHomeData event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final result = await homeUseCase.getHomeData();
      if (result.status) {
        emit(HomeSuccess(homeEntity: result));
      } else {
        emit(HomeFailure(error: result.data.toString()));
      }
    } catch (error) {
      emit(HomeFailure(error: error.toString()));
    }
  }
}
