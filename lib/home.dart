import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:furama/constants.dart';
import 'package:furama/my_clipper.dart';
import 'my_clipper_rate.dart';
import 'my_custom_paint.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  Color parentBgColor = Colors.transparent;
  Color activeBgColor = const Color(0xff97c0d4);
  Color inactiveBgColor = Colors.transparent;
  Color tabZeroBgColor = const Color(0xff97c0d4);
  Color tabOneBgColor = Colors.white;
  List<String> adsItems = [
    "assets/view_photos/photo_1.jpeg",
    "assets/view_photos/photo_2.jpeg",
    "assets/view_photos/photo_3.jpeg",
  ];

  late TabController _tabController;
  TextStyle iconTextstyle = const TextStyle(
    fontFamily: 'EncodeSansSemiCondensed-Light',
    color: Colors.black54,
    fontWeight: FontWeight.bold,
  );
  // int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    // _controller.animateTo()
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 2000),
        value: 1.0,
        lowerBound: 0.0,
        upperBound: 1.0);
    // _controller =
    //     AnimationController(duration: const Duration(seconds: 1), vsync: this);
    // _animation =
    //     CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      // if (_tabController.indexIsChanging) {

      //  _controller.forward(
      //       from: 0.0,
      //     )
      _controller = AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 2000),
          value: 0.0,
          lowerBound: 0.0,
          upperBound: 1.0);
      _controller.animateTo(1,
          duration: const Duration(seconds: 3), curve: Curves.fastOutSlowIn);

      // )

      // }
      // setState(() {
      //   _selectedIndex = _tabController.index;
      // });
    });
  }

  // @override
  // void dispose() {
  //   _tabController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.arrow_back,
                      color: mainColor,
                    ),
                    Row(
                      children: [
                        Image.asset('assets/currency/currency.png'),
                        const SizedBox(
                          width: 16,
                        ),
                        Image.asset('assets/chatactive/chatactive.png'),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 16.0),
                            child: Text(
                              "Furama Riverfront, Singapore",
                              style: TextStyle(
                                fontFamily: 'EncodeSansSemiCondensed-Black',
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        Image.asset('assets/nextred/nextred.png'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("405 Havelock Road, Singapore 169633"),
                        Image.asset(
                          "assets/currentlocation/currentlocation.png",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Stack(
                    children: [
                      CarouselSlider.builder(
                        itemCount: adsItems.length,
                        options: CarouselOptions(
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 8),
                          viewportFraction: 0.8,
                          aspectRatio: 1.6,
                          enlargeCenterPage: true,
                        ),
                        itemBuilder: (context, index, realIdx) {
                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(adsItems[index])),
                            ),
                            height: 300,
                          );
                        },
                      ),
                      Positioned(
                        right: 16,
                        bottom: 0,
                        child: ClipPath(
                          clipper: MyClipperRate(),
                          child: SizedBox(
                            height: 40,
                            width: 100,
                            child: Container(
                              color: const Color(0xff3c3b3b),
                              child: const Center(
                                child: Text(
                                  "See All 2/68",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
              Container(
                margin: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/theme/theme.png"),
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          child: Text(
                            "Amenities",
                            style: iconTextstyle,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/workout/workout.png"),
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          child: Text(
                            "Facilities",
                            style: iconTextstyle,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/fnb/fnb.png"),
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          child: Text(
                            "F&B",
                            style: iconTextstyle,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/kidsfamily/kidsfamily.png"),
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          child: Text(
                            "Kids/family",
                            style: iconTextstyle,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/wellness/wellness.png"),
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          child: Text(
                            "Wellness",
                            style: iconTextstyle,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Center(
                  child: CustomPaint(
                    painter: MyParallelPaint(),
                    child: SizedBox(
                      width: 300,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                _tabController.index = 0;
                                setState(() {
                                  tabOneBgColor = inactiveBgColor;
                                  tabZeroBgColor = activeBgColor;
                                  parentBgColor = activeBgColor;
                                });
                              },
                              child: ClipPath(
                                clipper: MyClipper(),
                                child: Container(
                                  height: 50,
                                  width: 150,
                                  color: tabZeroBgColor,
                                  child: const Center(
                                    child: Text(
                                      "By Rooms",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff0c3852),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                _tabController.index = 1;
                                setState(() {
                                  tabZeroBgColor = inactiveBgColor;
                                  tabOneBgColor = activeBgColor;
                                  parentBgColor = activeBgColor;
                                });
                              },
                              child: ClipPath(
                                clipper: MyClipperRate(),
                                child: Container(
                                  height: 50,
                                  width: 150,
                                  color: tabOneBgColor,
                                  child: const Center(
                                    child: Text(
                                      "By Rates",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff0c3852),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 600,
                width: double.infinity,
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                child: FadeTransition(
                  opacity: _controller,
                  // scale: _controller,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.zero,
                                  padding: EdgeInsets.zero,
                                  height: 200,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          "assets/view_photos/photo_2.jpeg"),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Deluxe Twin",
                                          style: TextStyle(
                                            fontFamily:
                                                'EncodeSansSemiCondensed-Bold',
                                            fontSize: 16,
                                          ),
                                        ),
                                        Row(
                                          children: const [
                                            Text(
                                              "Twin Single Beds, Cable TV, Free Wifi",
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: true,
                                              style: TextStyle(),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    rateBtn,
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              "Avg. Night / Room From",
                                              style: TextStyle(
                                                fontFamily:
                                                    'EncodeSansSemiCondensed-Bold',
                                              ),
                                            ),
                                            Text(
                                              "Subject to GST & Service charge",
                                              style: TextStyle(
                                                fontFamily:
                                                    'EncodeSansSemiCondensed-Light',
                                              ),
                                            )
                                          ]),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: RichText(
                                        text: const TextSpan(
                                          text: 'SGD ',
                                          style: TextStyle(
                                            fontFamily:
                                                'EncodeSansSemiCondensed-Black',
                                            fontSize: 12,
                                            color: Colors.black,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: "161.42",
                                              style: TextStyle(
                                                fontFamily:
                                                    'EncodeSansSemiCondensed-Black',
                                                color: Colors.black,
                                                fontSize: 22,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Container(
                                  height: 2,
                                  color: Colors.black54.withOpacity(0.4),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              margin: EdgeInsets.zero,
                              padding: EdgeInsets.zero,
                              height: 200,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      "assets/view_photos/photo_3.jpeg"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            DottedBorder(
                              color: Colors.grey,
                              strokeCap: StrokeCap.butt,
                              padding: const EdgeInsets.all(0),
                              strokeWidth: 1,
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "YOUR E-VOUCHER RATE",
                                              style: TextStyle(
                                                  fontFamily:
                                                      'EncodeSansSemiCondensed-Bold'),
                                            ),
                                            Image.asset(
                                                'assets/nextred/nextred.png'),
                                          ],
                                        ),
                                        const Text(
                                          "Mobile App Special Voucher",
                                          style: TextStyle(
                                            fontFamily:
                                                'EncodeSansSemiCondensed-Bold',
                                            fontSize: 20,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                      "assets/fnb/fnb.png"),
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 8.0),
                                                    child: Text(
                                                      "Inclusive of Breakfast",
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 2,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                      "assets/discount/discount.png"),
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 4.0),
                                                    child: Text(
                                                      "20% off In-Room Service",
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 2,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: rateBtn,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        Container(
                                          height: 2,
                                          color:
                                              Colors.black54.withOpacity(0.4),
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: const [
                                                    Text(
                                                      "Avg. Night / Room From",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'EncodeSansSemiCondensed-Bold',
                                                      ),
                                                    ),
                                                    Text(
                                                      "Subject to GST & Service charge",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'EncodeSansSemiCondensed-Light',
                                                      ),
                                                    )
                                                  ]),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: RichText(
                                                text: const TextSpan(
                                                  text: 'SGD ',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'EncodeSansSemiCondensed-Black',
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: "161.42",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'EncodeSansSemiCondensed-Black',
                                                        color: Colors.black,
                                                        fontSize: 22,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(0),
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    width: double.infinity,
                                    color: const Color(0xffffde77),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Icon(
                                          Icons.card_membership,
                                          color: Colors.black,
                                          size: 20,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 8),
                                          child: Text(
                                            "MEMBERS DEALS",
                                            style: TextStyle(
                                              fontFamily:
                                                  'EncodeSansSemiCondensed-Bold',
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            DottedBorder(
                              color: Colors.grey,
                              strokeCap: StrokeCap.butt,
                              padding: const EdgeInsets.all(0),
                              strokeWidth: 1,
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Weekend Staycation",
                                              style: TextStyle(
                                                fontFamily:
                                                    'EncodeSansSemiCondensed-Bold',
                                                fontSize: 20,
                                              ),
                                            ),
                                            Image.asset(
                                                'assets/nextred/nextred.png'),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                      "assets/fnb/fnb.png"),
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 8.0),
                                                    child: Text(
                                                      "Inclusive of Breakfast",
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 2,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                      "assets/discount/discount.png"),
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 4.0),
                                                    child: Text(
                                                      "20% off In-Room Service",
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 2,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: rateBtn,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        Container(
                                          height: 2,
                                          color:
                                              Colors.black54.withOpacity(0.4),
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: const [
                                                    Text(
                                                      "Avg. Night / Room From",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'EncodeSansSemiCondensed-Bold',
                                                      ),
                                                    ),
                                                    Text(
                                                      "Subject to GST & Service charge",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'EncodeSansSemiCondensed-Light',
                                                      ),
                                                    )
                                                  ]),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: RichText(
                                                text: const TextSpan(
                                                  text: 'SGD ',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'EncodeSansSemiCondensed-Black',
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: "161.42",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'EncodeSansSemiCondensed-Black',
                                                        color: Colors.black,
                                                        fontSize: 22,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget rateBtn = OutlinedButton(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(
        width: 1.5,
        color: mainColor,
        style: BorderStyle.solid,
      ),
    ),
    onPressed: () {},
    child: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 12),
      child: Text(
        "View Rates",
        style: TextStyle(
          fontSize: 12,
          color: mainColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
