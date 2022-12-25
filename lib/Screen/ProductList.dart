import 'package:cached_network_image/cached_network_image.dart';
import 'package:fetch_data_api_json_array/bloc/HomeBloc.dart';
import 'package:fetch_data_api_json_array/bloc/HomeEvent.dart';
import 'package:fetch_data_api_json_array/bloc/HomeState.dart';
import 'package:fetch_data_api_json_array/models/BarangModels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Test JSON Array",
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () => BlocProvider.of<HomeBloc>(context).add(LoadApiEvent()),
              child: Icon(Icons.refresh),
            ),
          ),
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is HomeLoadedDataState) {
            // ignore: unnecessary_null_comparison
            if (state.products == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              List<ApiModels> products = state.products;
              return ListView(
                padding: EdgeInsets.only(),
                children: List.generate(products.length, (index) {
                  return Container(
                    child: Material(
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 100,
                            width: 100,
                            child: CachedNetworkImage(
                              imageUrl: products[index].productsPhoto,
                              placeholder: (context, url) =>
                                  Container(
                                    height: 50,
                                    width: 50,
                                    child: CircularProgressIndicator()
                                  ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(products[index].nmBarang),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Rp. "+products[index].harga)
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              );
            }
          }
          if (state is HomeNoInternetState) {
            return Text("Ga Ada Internet");
          }
          return Container();
        },
      ),
    );
  }
}
