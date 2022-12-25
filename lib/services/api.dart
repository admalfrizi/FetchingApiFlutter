import 'package:fetch_data_api_json_array/models/BarangModels.dart';
import 'package:http/http.dart' as http;

class APIService {
  static const String url = 'https://aaistore.000webhostapp.com/apiproduk.php';

  Future<List<ApiModels>> getModels() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (200 == response.statusCode) {
        final List<ApiModels> models = apiModelsFromJson(response.body);
        return models;
      } else {
        return <ApiModels>[];
      }
    } catch (e) {
      return <ApiModels>[];
    }
  }
}
