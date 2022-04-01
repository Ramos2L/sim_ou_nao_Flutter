import 'package:aplicacao_sim_nao/cubit/resposta_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  
        title: const Text(''),
        backgroundColor: const Color.fromARGB(255, 222, 174, 20),
      ),
      body: Container( 
        alignment: Alignment.center, 
        child: Column(  
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/sim_ou_nao.png', width: 200, height: 200,),
            const Padding(padding: EdgeInsets.all(20)),
            const Text('Olá, memorize uma situação e clique no botão para ter sua resposta', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            const Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
              onPressed: (){
                final messageCubit = context.read<RespostaCubit>();
                messageCubit.getReposta();
              },
              child: const Text('RESPOSTA', style: TextStyle(fontSize: 20),),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 222, 174, 20),
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            const Message(),
          ],
        ),
      ),
    );
  }
}

class Message extends StatelessWidget {
  const Message({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RespostaCubit, RespostaState>(
      builder: (context, state) { 

        Random random = Random();
        int randomNumber = random.nextInt(10);
        
        String message = '';
        var messageSim = [
          'Sim, por favor',
          'Sim, você deve fazer isso e é o melhor na ocasião',
          'Sim',
          'Si, se jogue',
          'Sim, isso é o correto a se pensar',
          'Sim, Sim, mil vezes Sim',
          'Sim ou Claro',
          'Sim, claro que sim',
          'Sim, Sim... Sim...',
          'Sim, e não pense mais nisso'
        ];
        var messageNao = [
          'Não, por favor',
          'Não, Não e ta tudo bem',
          'Não nunquinha',
          'N, as vezes é melhor só o Não',
          'Não, isso é o correto.',
          'Não, Não, mil vezes Não',
          'Não e Não',
          'Não, claro que Não',
          'Não, Não... Não...',
          'Não, e não pense mais nisso, não podemos controlar tudo'
        ];

        if ( state is RespostaSim ){
          message = messageSim[randomNumber];
        } else if ( state is RespostaNao ){
          message = messageNao[randomNumber];
        }
      
        return Container(  
          alignment: Alignment.center, 
          padding: const EdgeInsets.all(15),
          child: Text(message, textAlign: TextAlign.center, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
        );
      }
    );
  }
}