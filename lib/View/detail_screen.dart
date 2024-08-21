import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/url_launcher_controller.dart';
import 'home_screen.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.account_circle_outlined),
        centerTitle: true,
        title: const Text('News'),
      ),
      body: FutureBuilder(
        future: detailHelper,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Image.network((detailList!
                      .articles[selectedIndex].urlToImage ==
                      '')
                      ? 'https://images.tv9hindi.com/wp-content/uploads/2024/08/chief-election-commissioner-rajiv-kumar-addresses-press-conference-in-jammu.jpg?w=670&ar=16:9'
                      : detailList!.articles[selectedIndex].urlToImage),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          detailList!.articles[selectedIndex].source.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          detailList!.articles[selectedIndex].title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          detailList!.articles[selectedIndex].description,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          detailList!.articles[selectedIndex].content,
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                urlController.urlLaunch(
                                    detailList!.articles[selectedIndex].url);
                              },
                              child: const Text(
                                'Click here for more information',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(detailList!
                                .articles[selectedIndex].publishedAt),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            Text(detailList!.articles[selectedIndex].author),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        const Divider(
                          thickness: 2,
                        ),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: width * 0.4,
                              child: Image.asset(
                                'assets/img/music.png',
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: width * 0.5,
                              child: const Text(
                                'Be the 1st one to Start the conversation',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: height * 0.06,
                          width: width,
                          color: Colors.white,
                          child: const Text(
                            'Start Commenting',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Container(
                          height: height * 0.06,
                          width: width,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Repost',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              Icon(Icons.sync),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        const Divider(
                          thickness: 2,
                        ),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        const Text(
                          'Hashtags',
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        hashtagContainer(height, '#BE AWARE OF CYBER CRIME'),
                        hashtagContainer(height, '#AI IN INDIA'),
                        hashtagContainer(height, '#INDIA WON THE WORLD CUP'),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        const Divider(
                          thickness: 2,
                        ),
                        SizedBox(
                          height: height * 0.015,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Container hashtagContainer(double height, String text) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: height * 0.045,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: Text(
        text,
      ),
    );
  }
}

var urlController = Get.put(UrlLauncherController());
