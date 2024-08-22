import 'package:get/get.dart';
import '../Helper/api_helper.dart';
import '../Modal/news_modal.dart';

class NewsDataController extends GetxController {
  var apiHelper = ApiHelper();
  NewsDataModal? newsDataModal;
  NewsDataModal? teslaDataModal;
  NewsDataModal? businessDataModal;
  NewsDataModal? techDataModal;
  NewsDataModal? wallStreetDataModal;

  // newsDataModal
  // businessDataModal
  // teslaDataModal

  // techDataModal
  // wallStreetDataModal

  Future<NewsDataModal?> fetchCompanyApiData() async {
    final data = await apiHelper.fetchApiCompanyArticleData();
    newsDataModal = NewsDataModal.fromMap(data);
    return newsDataModal;
  }

  Future<NewsDataModal?> fetchTeslaApiData() async {
    final data = await apiHelper.fetchApiTeslaData();
    teslaDataModal = NewsDataModal.fromMap(data);
    return teslaDataModal;
  }

  Future<NewsDataModal?> fetchBusinessApiData() async {
    final data = await apiHelper.fetchApiBusinessData();
    businessDataModal = NewsDataModal.fromMap(data);
    return businessDataModal;
  }

  Future<NewsDataModal?> fetchTechApiData() async {
    final data = await apiHelper.fetchApiTechData();
    techDataModal = NewsDataModal.fromMap(data);
    return techDataModal;
  }

  Future<NewsDataModal?> fetchStocksApiData() async {
    final data = await apiHelper.fetchApiWallStreetData();
    wallStreetDataModal = NewsDataModal.fromMap(data);
    return wallStreetDataModal;
  }
}