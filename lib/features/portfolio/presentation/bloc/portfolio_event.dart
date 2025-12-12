part of 'portfolio_bloc.dart';

abstract class PortfolioEvent extends Equatable {
  const PortfolioEvent();

  @override
  List<Object> get props => [];
}

class LoadPortfolioData extends PortfolioEvent {}

class ChangeSelectedExperience extends PortfolioEvent {
  final int index;

  const ChangeSelectedExperience(this.index);

  @override
  List<Object> get props => [index];
}
