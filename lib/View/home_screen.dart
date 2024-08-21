import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/news_controller.dart';
import '../Modal/news_modal.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.account_circle_outlined),
          scrolledUnderElevation: 0.1,
          centerTitle: true,
          title: const Text('Daily Hunt'),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(Icons.notifications),
            ),
          ],
          bottom: const TabBar(
            tabAlignment: TabAlignment.start,
            indicatorPadding: EdgeInsets.zero,
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            isScrollable: true,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'For You'),
              Tab(text: 'Tesla'),
              Tab(text: 'Business'),
              Tab(text: 'Tech'),
              Tab(text: 'Market & Investments'),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TabBarView(
            children: [
              FutureBuilder(
                future: newsController.fetchCompanyApiData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return listViewMethod(
                      width: width,
                      modal: newsController.newsModal!,
                      fetchData: newsController.fetchCompanyApiData(),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              FutureBuilder(
                future: newsController.fetchTeslaApiData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return listViewMethod(
                      width: width,
                      modal: newsController.teslaModal!,
                      fetchData: newsController.fetchTeslaApiData(),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              FutureBuilder(
                future: newsController.fetchBusinessApiData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return listViewMethod(
                      width: width,
                      modal: newsController.businessModal!,
                      fetchData: newsController.fetchBusinessApiData(),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              FutureBuilder(
                future: newsController.fetchTechApiData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return listViewMethod(
                      width: width,
                      modal: newsController.techModal!,
                      fetchData: newsController.fetchTechApiData(),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              FutureBuilder(
                future: newsController.fetchStocksApiData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return listViewMethod(
                      width: width,
                      modal: newsController.stockModal!,
                      fetchData: newsController.fetchStocksApiData(),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListView listViewMethod({
    required double width,
    required NewsModal modal,
    required Future<NewsModal?> fetchData,
  }) {
    return ListView.builder(
      itemCount: newsController.newsModal!.articles.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          detailHelper = fetchData;
          detailList = modal;
          selectedIndex = index;
          Get.toNamed('/detail');
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network((modal.articles[index].urlToImage == '')
                  ? 'https://images.tv9hindi.com/wp-content/uploads/2024/08/chief-election-commissioner-rajiv-kumar-addresses-press-conference-in-jammu.jpg?w=670&ar=16:9'
                  : modal.articles[index].urlToImage),
              Text(
                modal.articles[index].source.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              Text(modal.articles[index].title),
            ],
          ),
        ),
      ),
    );
  }
}

final newsController = Get.put(NewsController());

var detailHelper;
NewsModal? detailList;
int selectedIndex = 0;
