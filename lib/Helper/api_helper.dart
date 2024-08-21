import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  Future<Map> fetchCompanyApiData() async {
    String companyApi =
        'https://newsapi.org/v2/everything?q=apple&from=2024-08-12&to=2024-08-12&sortBy=popularity&apiKey=6ed2bf03baa24a918da63092568b372c';
    Uri uri = Uri.parse(companyApi);
    Response response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map data = jsonDecode(response.body);
      return data;
    } else {
      return {};
    }
  }

  Future<Map> fetchTeslaDetails() async {
    String teslaApi =
        'https://newsapi.org/v2/everything?q=tesla&from=2024-07-13&sortBy=publishedAt&apiKey=6ed2bf03baa24a918da63092568b372c';
    Uri uri = Uri.parse(teslaApi);
    Response response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map data = jsonDecode(response.body);
      return data;
    } else {
      return {};
    }
  }

  Future<Map> fetchBusinessDetails() async {
    String businessApi =
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=6ed2bf03baa24a918da63092568b372c';
    Uri uri = Uri.parse(businessApi);
    Response response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map data = jsonDecode(response.body);
      return data;
    } else {
      return {};
    }
  }

  Future<Map> fetchTechDetails() async {
    String techApi =
        'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=6ed2bf03baa24a918da63092568b372c';
    Uri uri = Uri.parse(techApi);
    Response response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map data = jsonDecode(response.body);
      return data;
    } else {
      return {};
    }
  }

  Future<Map> fetchStocksDetails() async {
    String stocksApi =
        'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=6ed2bf03baa24a918da63092568b372c';
    Uri uri = Uri.parse(stocksApi);
    Response response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map data = jsonDecode(response.body);
      return data;
    } else {
      return {};
    }
  }
}
