import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc2/app_events.dart';
import 'package:flutter_bloc2/app_states.dart';
import 'package:flutter_bloc2/bloc.dart';
import 'package:flutter_bloc2/service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MovieBloc()
            ..add(
              LoadMovieEvent(),
            ),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomePage()),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AppBar BLOC"),
      ),
      body: Column(
        children: [
          BlocBuilder<MovieBloc, MovieState>(
            builder: (context, state) {
              if (state is LoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is HasDataState) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.dataMovie!.results.length,
                  itemBuilder: (context, index) {
                    return Text(state.dataMovie!.results[index].title);
                  },
                );
              }
              if (state is ErrorState) {
                return const Center(
                  child: Text("Error"),
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}

/*
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MovieBloc(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("AppBar BLOC"),
        ),
        body: Column(
          children: [
            BlocProvider(
              create: (context) => MovieBloc()
                ..add(
                  LoadMovieEvent(),
                ),
              child: BlocBuilder<MovieBloc, MovieState>(
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is HasDataState) {
                    return Container(
                      decoration: BoxDecoration(color: Colors.lightBlueAccent[100]),
                      
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        itemCount: state.dataMovie!.results.length,
                        itemBuilder: (context, index) {
                          return Text(state.dataMovie!.results[index].title);
                        },
                      ),
                    );
                  }
                  if (state is ErrorState) {
                    return const Center(
                      child: Text("Error"),
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

*/
