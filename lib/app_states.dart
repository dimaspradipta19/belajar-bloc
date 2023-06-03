import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc2/model.dart';

// abstract class and extends equatable
@immutable
abstract class MovieState extends Equatable {}

// loading state
class LoadingState extends MovieState {
  @override
  List<Object?> get props => [];
}

// has data state
class HasDataState extends MovieState {
  final MovieModel? dataMovie;
  HasDataState(this.dataMovie);

  @override
  List<Object?> get props => [dataMovie!.results];
}

// Error state
class ErrorState extends MovieState {
  final String error;
  ErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
