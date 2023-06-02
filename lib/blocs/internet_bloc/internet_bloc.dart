import 'dart:async';

import 'package:bloc_events_states_1/blocs/internet_bloc/internet_events.dart';
import 'package:bloc_events_states_1/blocs/internet_bloc/internet_states.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBloc extends Bloc<InternetEvents, InternetStates> {
   // ignore: prefer_final_fields
   Connectivity _connectivity= Connectivity();
   StreamSubscription? connecttivitySubscription;
  InternetBloc() : super(InternetInitialState()) {
  
   
    on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));
    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));


   connecttivitySubscription= _connectivity.onConnectivityChanged.listen((result) { 
      if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi){
        add(InternetGainedEvent());
      }
      else{
        add(InternetLostEvent());
      }
    });
  }

  @override
  Future<void> close() {
    connecttivitySubscription?.cancel();
    return super.close();
  }
}