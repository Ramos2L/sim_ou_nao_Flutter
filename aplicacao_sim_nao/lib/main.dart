import 'package:aplicacao_sim_nao/cubit/resposta_cubit.dart';
import 'package:aplicacao_sim_nao/pages/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Aplicacao Sim ou Nao',
      home: BlocProvider<RespostaCubit>(
        create: (context) => RespostaCubit(), 
        child: const Home()
      )
    );
  }
}