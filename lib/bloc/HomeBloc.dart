import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fetch_data_api_json_array/bloc/HomeEvent.dart';
import 'package:fetch_data_api_json_array/bloc/HomeState.dart';
import 'package:fetch_data_api_json_array/services/api.dart';
import 'package:fetch_data_api_json_array/services/connectService.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final APIService _api;
  final ConnectivityService _connectivityService;

  HomeBloc(this._api, this._connectivityService) : super(HomeLoadingState()) {
    _connectivityService.connectStream.stream.listen((event) {
      if (event == ConnectivityResult.none) {
        print("No Internet");
        add(NoInternetEvent());
      } else {
        print("Yes Internet");
        add(LoadApiEvent());
      }
    });

    on<LoadApiEvent>((event, emit) async {
      emit(HomeLoadingState());
      final product = await _api.getModels();
      emit(HomeLoadedDataState(product));
    });

    on<NoInternetEvent>((event, emit) {
      emit(HomeNoInternetState());
    });
  }
}
