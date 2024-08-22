import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/news_controller.dart';
import '../Modal/news_modal.dart';
// import '../../Controller/CompanyArticleController.dart';

NewsDataController newsDataController = Get.put(NewsDataController());

List bottomBar = [
  const Icon(Icons.home_outlined),
  const Icon(Icons.search),
  const Icon(Icons.square_outlined),
  const Icon(Icons.person_add_alt),
  const Icon(Icons.notifications_none_rounded),
  const Icon(Icons.mail_outline_rounded),
];
int selectPage = 0;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectPage,
          // backgroundColor: Colors.black,
          onTap: (int newIndex) {
            selectPage = newIndex;
          },
          items: const [
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.square_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_add_alt), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_none_rounded), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.mail_outline_rounded), label: 'Home'),
          ],
        ),
        appBar: AppBar(
          backgroundColor: Colors.black,
          scrolledUnderElevation: 0.1,
          centerTitle: true,
          leading: const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Icon(
              Icons.account_circle_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
          title: Container(
            height: h * 0.06,
            width: w * 0.15,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/twitter_logo.png'),
              ),
            ),
          ),
          actions: const [
            Text(
              'Upgrade',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            ),
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.more_vert_rounded,
                color: Colors.white,
                size: 30,
              ),
            )
          ],
          bottom: const TabBar(
            dividerColor: Colors.grey,
            dividerHeight: 0.5,
            indicatorColor: Colors.blue,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            automaticIndicatorColorAdjustment: true,
            labelColor: Colors.white,
            tabs: [
              Tab(
                text: 'For You',
              ),
              Tab(
                text: 'Automobiles',
              ),
              Tab(
                text: 'Businesses',
              ),
              Tab(
                text: 'Tech & IT ',
              ),
              Tab(
                text: 'Market Insights',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FutureBuilder(
              future: newsDataController.fetchCompanyApiData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount:
                        newsDataController.newsDataModal!.articles.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          detailScreen = newsDataController.fetchCompanyApiData();
                          detailList = newsDataController.newsDataModal!;
                          selectedIndex = index;
                          Get.toNamed('/detail');
                        },
                        child: Card(
                          color: Colors.black,
                          child: Column(
                            children: [
                              accountRow(h, w),
                              Container(
                                height: h * 0.3,
                                width: w * 0.9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage((newsDataController
                                                .newsDataModal!
                                                .articles[index]
                                                .urlToImage ==
                                            '')
                                        ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqTDCEsvutyTcwyKh0R7p4a2JJ8GyjNqi7BA&s'
                                        : newsDataController.newsDataModal!
                                            .articles[index].urlToImage),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  newsDataController
                                      .newsDataModal!.articles[index].title,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    newsDataController
                                        .newsDataModal!.articles[index].author,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 7),
                                    child: Text(
                                      'Our Sponsor',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        newsDataController.newsDataModal!
                                            .articles[index].source.name,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                thickness: 1,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                }
              },
            ),
            FutureBuilder(
              future: newsDataController.fetchTeslaApiData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount:
                        newsDataController.teslaDataModal!.articles.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          detailScreen = newsDataController.fetchTeslaApiData();
                          detailList = newsDataController.teslaDataModal!;
                          selectedIndex = index;
                          Get.toNamed('/detail');
                        },
                        child: Card(
                          color: Colors.black,
                          child: Column(
                            children: [
                              accountRow(h, w),
                              Container(
                                height: h * 0.3,
                                width: w * 0.9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage((newsDataController
                                                .teslaDataModal!
                                                .articles[index]
                                                .urlToImage ==
                                            '')
                                        ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqTDCEsvutyTcwyKh0R7p4a2JJ8GyjNqi7BA&s'
                                        : newsDataController.teslaDataModal!
                                            .articles[index].urlToImage),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  newsDataController
                                      .teslaDataModal!.articles[index].title,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    newsDataController
                                        .teslaDataModal!.articles[index].author,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 7),
                                    child: Text(
                                      'Our Sponsor',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        newsDataController.teslaDataModal!
                                            .articles[index].source.name,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                thickness: 1,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                }
              },
            ),
            FutureBuilder(
              future: newsDataController.fetchBusinessApiData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount:
                        newsDataController.businessDataModal!.articles.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          detailScreen =
                              newsDataController.fetchBusinessApiData();
                          detailList = newsDataController.businessDataModal!;
                          selectedIndex = index;
                          Get.toNamed('/detail');
                        },
                        child: Card(
                          color: Colors.black,
                          child: Column(
                            children: [
                              accountRow(h, w),
                              Container(
                                height: h * 0.3,
                                width: w * 0.9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(newsDataController
                                        .businessDataModal!
                                        .articles[index]
                                        .urlToImage),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  newsDataController
                                      .businessDataModal!.articles[index].title,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    newsDataController.businessDataModal!
                                        .articles[index].author,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 7),
                                    child: Text(
                                      'Our Sponsor',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        newsDataController.businessDataModal!
                                            .articles[index].source.name,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                thickness: 1,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                }
              },
            ),
            FutureBuilder(
              future: newsDataController.fetchTechApiData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount:
                        newsDataController.techDataModal!.articles.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          detailScreen = newsDataController.fetchTechApiData();
                          detailList = newsDataController.techDataModal!;
                          selectedIndex = index;
                          Get.toNamed('/detail');
                        },
                        child: Card(
                          color: Colors.black,
                          child: Column(
                            children: [
                              accountRow(h, w),
                              Container(
                                height: h * 0.3,
                                width: w * 0.9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(newsDataController
                                        .techDataModal!
                                        .articles[index]
                                        .urlToImage),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  newsDataController
                                      .techDataModal!.articles[index].title,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    newsDataController
                                        .techDataModal!.articles[index].author,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 7),
                                    child: Text(
                                      'Our Sponsor',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        newsDataController.techDataModal!
                                            .articles[index].source.name,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                thickness: 1,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                }
              },
            ),
            FutureBuilder(
              future: newsDataController.fetchStocksApiData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount:
                        newsDataController.wallStreetDataModal!.articles.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          detailScreen = newsDataController.fetchStocksApiData();
                          detailList = newsDataController.techDataModal!;
                          selectedIndex = index;
                          Get.toNamed('/detail');
                        },
                        child: Card(
                          color: Colors.black,
                          child: Column(
                            children: [
                              accountRow(h, w),
                              Container(
                                height: h * 0.3,
                                width: w * 0.9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(newsDataController
                                        .wallStreetDataModal!
                                        .articles[index]
                                        .urlToImage),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  newsDataController.wallStreetDataModal!
                                      .articles[index].title,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    newsDataController.wallStreetDataModal!
                                        .articles[index].author,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 7),
                                    child: Text(
                                      'Our Sponsor',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        newsDataController.wallStreetDataModal!
                                            .articles[index].source.name,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                thickness: 1,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Padding accountRow(double h, double w) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: h * 0.06,
            width: w * 0.15,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/profilePic.jpg'),
              ),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Yash Jain',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: w * 0.015,
                  ),
                  const Icon(
                    Icons.verified,
                    color: Colors.blue,
                    size: 20,
                  ),
                ],
              ),
              const Text(
                '@yashjain',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w100),
              )
            ],
          ),
          SizedBox(
            width: w * 0.15,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              // maximumSize: Size(1, 1),
              backgroundColor: Colors.white,
              // padding:
              //     const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              minimumSize: const Size(90, 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              'Follow',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  letterSpacing: .75),
            ), // Button ka text
          )
        ],
      ),
    );
  }
}

// var detailHelper;
// NewsModal? detailList;

int selectedIndex = 0;
var detailScreen;
NewsDataModal? detailList;
