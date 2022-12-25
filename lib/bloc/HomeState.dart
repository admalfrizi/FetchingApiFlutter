import 'package:equatable/equatable.dart';
import 'package:fetch_data_api_json_array/models/BarangModels.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadedDataState extends HomeState {
  final List<ApiModels> products;

  HomeLoadedDataState(this.products);

  @override
  List<Object?> get props => [products];
}

class HomeNoInternetState extends HomeState {
  @override
  List<Object> get props => [];
}
