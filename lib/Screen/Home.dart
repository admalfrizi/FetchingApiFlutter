import 'package:fetch_data_api_json_array/Screen/ProductList.dart';
import 'package:fetch_data_api_json_array/bloc/HomeBloc.dart';
import 'package:fetch_data_api_json_array/bloc/HomeEvent.dart';
import 'package:fetch_data_api_json_array/services/api.dart';
import 'package:fetch_data_api_json_array/services/connectService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Flexible(
        child: BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(
              RepositoryProvider.of<APIService>(context),
              RepositoryProvider.of<ConnectivityService>(context))
            ..add(LoadApiEvent()),
          child: ProductList(),
        ),
      )
    ]);
  }
}
