import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc2/app_events.dart';
import 'package:flutter_bloc2/app_states.dart';
// import 'package:flutter_bloc2/model.dart';
import 'package:flutter_bloc2/service.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  // MovieModel? movieModel;
  final ServiceMovie service = ServiceMovie();

  // : super(parameter ini harus mem pass initial value)
  MovieBloc() : super(LoadingState()) {
    // loadmovieevent dijalankan akan meng emit loading state
    on<LoadMovieEvent>(
      (event, emit) async {
        // menjalankan loadingstate
        emit(LoadingState());

        // try catch membuat sebuah var baru user yang isinya service.getmovie
        // lalu meng emit dengan data si var user tadi
        try {
          final user = await service.getMovie();
          emit(HasDataState(user));
        } catch (e) {
          // kalau var usernya error, kirim error state to string
          emit(ErrorState(e.toString()));
        }
      },
    );
  }
}
