
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  Future<Map> fetchApiCompanyArticleData() async {
    String companyApi =
    // 'https://newsapi.org/v2/everything?q=apple&from=2024-08-12&to=2024-08-12&sortBy=popularity&apiKey=4e531b00cdc7446c975f9daf50d32b34';
        'https://newsapi.org/v2/everything?q=apple&from=2024-08-20&to=2024-08-20&sortBy=popularity&apiKey=5473dca2e2ee462cbfd43a397dc00b05';

    Uri url = Uri.parse(companyApi);
    Response response = await http.get(url);
    if (response.statusCode == 200) {
      final Map data = jsonDecode(response.body);
      return data;
    } else {
      return {};
    }
  }

  Future<Map> fetchApiTeslaData() async {
    String teslaApi =
    // 'https://newsapi.org/v2/everything?q=tesla&from=2024-07-13&sortBy=publishedAt&apiKey=4e531b00cdc7446c975f9daf50d32b34';
        'https://newsapi.org/v2/everything?q=tesla&from=2024-07-21&sortBy=publishedAt&apiKey=5473dca2e2ee462cbfd43a397dc00b05';

    Uri url = Uri.parse(teslaApi);
    Response response = await http.get(url);
    if (response.statusCode == 200) {
      final Map data = jsonDecode(response.body);
      return data;
    } else {
      return {};
    }
  }

  Future<Map> fetchApiBusinessData() async {
    String businessApi =
    // 'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=4e531b00cdc7446c975f9daf50d32b34';
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=5473dca2e2ee462cbfd43a397dc00b05';
    Uri url = Uri.parse(businessApi);
    Response response = await http.get(url);
    if (response.statusCode == 200) {
      final Map data = jsonDecode(response.body);
      return data;
    } else {
      return {};
    }
  }

  Future<Map> fetchApiTechData() async {
    String techApi =
    // 'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=4e531b00cdc7446c975f9daf50d32b34';
        'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=5473dca2e2ee462cbfd43a397dc00b05';

    Uri url = Uri.parse(techApi);
    Response response = await http.get(url);
    if (response.statusCode == 200) {
      final Map data = jsonDecode(response.body);
      return data;
    } else {
      return {};
    }
  }

  Future<Map> fetchApiWallStreetData() async {
    String stockApi =
    // 'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=4e531b00cdc7446c975f9daf50d32b34';
        'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=5473dca2e2ee462cbfd43a397dc00b05';

    Uri url = Uri.parse(stockApi);
    Response response = await http.get(url);
    if (response.statusCode == 200) {
      final Map data = jsonDecode(response.body);
      return data;
    } else {
      return {};
    }
  }
}
