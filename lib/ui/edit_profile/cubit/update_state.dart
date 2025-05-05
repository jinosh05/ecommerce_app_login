part of 'update_cubit.dart';

abstract class UpdateState extends Equatable {
  @override
  List<Object> get props => [];
}

class UpdateInitial extends UpdateState {}

class UpdateLoading extends UpdateState {}

class UpdateSuccess extends UpdateState {}

class UpdateFailure extends UpdateState {

  UpdateFailure(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}
