import 'package:flutter/material.dart';
import 'home_screen.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const BackButton(
          color: Colors.white,
        ),
        // centerTitle: true,
        title: const Text('Post',
            style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.w500)),
      ),
      body: ListView(
          children:[
            FutureBuilder(
              future: detailScreen,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: h * 0.06,
                                width: w * 0.15,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/profilePic.jpg'),
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Yash Jain',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(
                                        width: w * 0.015,
                                      ),
                                      Icon(
                                        Icons.verified,
                                        color: Colors.blue,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '@yashjain',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100),
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
                        ),
                        Container(
                          height: h * 0.5,
                          width: w * 0.99 + 10,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fitHeight,
                              image: NetworkImage(
                                (detailList!.articles[selectedIndex].urlToImage ==
                                    ''
                                    ? 'https://images.tv9hindi.com/wp-content/uploads/2024/08/chief-election-commissioner-rajiv-kumar-addresses-press-conference-in-jammu.jpg?w=670&ar=16:9'
                                    : detailList!
                                    .articles[selectedIndex].urlToImage),
                              ),
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 400,
                            width: 400,
                            child: Column(
                              children: [
                                Text(
                                  detailList!.articles[selectedIndex].source.name,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 30),
                                ),
                                // const SizedBox(
                                //   height: 7,
                                // ),
                                Text(
                                  detailList!.articles[selectedIndex].title,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    '- ${detailList!.articles[selectedIndex].author}',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                // const SizedBox(
                                //   height: 18,
                                // ),
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Description',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  detailList!.articles[selectedIndex].description,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.white,),
                  );
                }
              },
            ),
          ]
      ),
    );
  }
}
