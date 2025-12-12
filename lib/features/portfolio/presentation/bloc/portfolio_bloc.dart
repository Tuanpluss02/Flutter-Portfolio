import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/portfolio_data_model.dart';
import '../../domain/usecases/get_portfolio_data.dart';

part 'portfolio_event.dart';
part 'portfolio_state.dart';

@injectable
class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  final GetPortfolioData getPortfolioData;

  PortfolioBloc(this.getPortfolioData) : super(PortfolioInitial()) {
    on<LoadPortfolioData>(_onLoadPortfolioData);
    on<ChangeSelectedExperience>(_onChangeSelectedExperience);
  }

  Future<void> _onLoadPortfolioData(
    LoadPortfolioData event,
    Emitter<PortfolioState> emit,
  ) async {
    emit(PortfolioLoading());
    final result = await getPortfolioData(NoParams());
    result.fold(
      (failure) => emit(PortfolioError(failure.message)),
      (data) => emit(PortfolioLoaded(data: data, selectedExperienceIndex: 0)),
    );
  }

  void _onChangeSelectedExperience(
    ChangeSelectedExperience event,
    Emitter<PortfolioState> emit,
  ) {
    if (state is PortfolioLoaded) {
      final currentState = state as PortfolioLoaded;
      emit(currentState.copyWith(selectedExperienceIndex: event.index));
    }
  }
}
