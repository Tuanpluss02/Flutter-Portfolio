part of 'portfolio_bloc.dart';

abstract class PortfolioState extends Equatable {
  const PortfolioState();

  @override
  List<Object> get props => [];
}

class PortfolioInitial extends PortfolioState {}

class PortfolioLoading extends PortfolioState {}

class PortfolioLoaded extends PortfolioState {
  final PortfolioDataModel data;
  final int selectedExperienceIndex;

  const PortfolioLoaded({required this.data, required this.selectedExperienceIndex});

  PortfolioLoaded copyWith({
    PortfolioDataModel? data,
    int? selectedExperienceIndex,
  }) {
    return PortfolioLoaded(
      data: data ?? this.data,
      selectedExperienceIndex: selectedExperienceIndex ?? this.selectedExperienceIndex,
    );
  }

  @override
  List<Object> get props => [data, selectedExperienceIndex];
}

class PortfolioError extends PortfolioState {
  final String message;

  const PortfolioError(this.message);

  @override
  List<Object> get props => [message];
}
