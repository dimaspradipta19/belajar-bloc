import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class MovieEvent extends Equatable {
  const MovieEvent();
}

class LoadMovieEvent extends MovieEvent {
  @override
  List<Object?> get props => [];
}
