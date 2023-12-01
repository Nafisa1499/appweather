import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/model.dart';

abstract class APIState extends Equatable {
  const APIState();

  @override
  List<Object?> get props => [];
}

abstract class APIEvent extends Equatable {
  const APIEvent();

  @override
  List<Object> get props => [];
}

class GetAPI extends APIEvent {}

class APIInitial extends APIState {}

class APILoading extends APIState {}

class APILoaded extends APIState {
  final ModelClass modelClass;
  const APILoaded(this.modelClass);
}

class APIError extends APIState {
  final String? message;
  const APIError(this.message);
}
