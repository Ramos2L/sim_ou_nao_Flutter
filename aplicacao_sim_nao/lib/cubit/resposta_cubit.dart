import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:math';

part 'resposta_state.dart';

class RespostaCubit extends Cubit<RespostaState> {
  RespostaCubit() : super(RespostaInitial());

  Future<void> getReposta() async {

    Random random = Random();
    int randomNumber = random.nextInt(100);   

    if ( (randomNumber / 2) % 2 == 0) {
      emit(RespostaSim());
    } else {
      emit(RespostaNao());
    }

  }

}
