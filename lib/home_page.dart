import 'package:bloc_events_states_1/blocs/internet_bloc/internet_bloc.dart';
import 'package:bloc_events_states_1/blocs/internet_bloc/internet_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<InternetBloc, InternetStates>(
          listener: (context, state) {
             if(state is InternetGainedState){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.green,
                  content: Text('Internet Connected')
                  )
              );
            }
             else if(state is InternetLostState){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.red,
                  content: Text('Internet Not Connected')
                  )
              );
            }
          },
          builder: (context, state) {
            if(state is InternetGainedState){
              return const Text('Connected');
            }
            else if(state is InternetLostState){
              return const Text('Not Connected');
            }
            else{
              return const Text('Loading...');
            }
          },
        ),
      ),
    );
  }
}
