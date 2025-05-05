part of 'update_cubit.dart';

abstract class UpdateState extends Equatable {
  @override
  List<Object> get props => [];
}

class UpdateInitial extends UpdateState {}

class UpdateLoading extends UpdateState {}

class UpdateSuccess extends UpdateState {}

class UpdateFailure extends UpdateState {
  final String error;

  UpdateFailure(this.error);

  @override
  List<Object> get props => [error];
}
