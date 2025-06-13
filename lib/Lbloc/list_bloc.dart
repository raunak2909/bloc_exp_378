import 'package:bloc_exp_378/Lbloc/list_event.dart';
import 'package:bloc_exp_378/Lbloc/list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListBloc extends Bloc<ListEvent, ListState>{

  ListBloc() : super(ListState(mData: [])){

    on<AddMapEvent>((event, emit){
      List<Map<String, dynamic>> currentStateValue = state.mData;
      currentStateValue.add(event.data);

      emit(ListState(mData: currentStateValue));
    });


    on<UpdateMapEvent>((event, emit){
      List<Map<String, dynamic>> currentStateValue = state.mData;
      currentStateValue[event.index] = event.data;

      emit(ListState(mData: currentStateValue));
    });

    on<DeleteMapEvent>((event, emit){
      List<Map<String, dynamic>> currentStateValue = state.mData;
      currentStateValue.removeAt(event.index);

      emit(ListState(mData: currentStateValue));
    });

  }

}