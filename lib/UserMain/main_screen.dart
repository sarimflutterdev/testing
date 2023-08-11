import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_build/reusable_widget/reusable_textformfield.dart';

import '../DescriptionScreen.dart';
import '../reusable_widget/colors.dart';

class main_screen extends StatefulWidget {
  const main_screen({super.key});

  @override
  State<main_screen> createState() => _main_screenState();
}

class _main_screenState extends State<main_screen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Container(
          child: Column(
            children: [
              UserAccountsDrawerHeader(

                currentAccountPictureSize: Size(80,80),
                decoration: BoxDecoration(
                  color: Color(0xff5c941b)
                ),
                accountName: Text('Basit'), accountEmail: Text('basit123@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/profilePic.jpg'),

              ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    menu(title: "Home",menuIcon: Icons.home,),
                    SizedBox(
                      height: 20,
                    ),
                    menu(title: "Feedback",menuIcon: Icons.note_alt_sharp,),
                    SizedBox(
                      height: 20,
                    ),
                    menu(title: "About",menuIcon: Icons.account_balance_outlined,),
                    SizedBox(
                      height: 20,
                    ),
                    menu(title: "Acount Setting",menuIcon: Icons.settings,),

                  ],
                ),
              )

            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          width: 220,
          height: 220,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('images/appLogo.png'))),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage('images/gridIcon.png'))),
          ),
        ),
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
            physics: const ScrollPhysics(), child: Main_screen_body()),
      ),
    );
  }
}

class menu extends StatelessWidget {
 IconData menuIcon;
 String title;


 menu({required this.menuIcon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: ListTile(
          leading: Icon(menuIcon),
          title: Text("$title",style: GoogleFonts.poppins(
            color: MyColors.button_color
          ),),
        ),
      ),
    );
  }
}

class Main_screen_body extends StatefulWidget {
  const Main_screen_body({super.key});

  @override
  State<Main_screen_body> createState() => _Main_screen_bodyState();
}

class _Main_screen_bodyState extends State<Main_screen_body> {
  final search_controller = TextEditingController();
  var tablist = [
    'Tab1',
    'Tab2',
    'Tab3',
    'Tab4',
    'Tab5',
    'Tab5',
    'Tab6',
    'Tab7',
    'Tab8'
  ];
  List images = [
    "https://images.pexels.com/photos/933054/pexels-photo-933054.jpeg?auto=compress&cs=tinysrgb&w=400",
    "https://images.pexels.com/photos/1261728/pexels-photo-1261728.jpeg?auto=compress&cs=tinysrgb&w=400",
    "https://images.pexels.com/photos/2335126/pexels-photo-2335126.jpeg?auto=compress&cs=tinysrgb&w=400"
  ];
  List names = ["Abc", "Xyz", "Dfg"];
  List recom_images = [
    'images/pic1.png',
    'images/pic2.png',
    'images/pic3.png',
    'images/pic5.png'
  ];
  List mainImages=['images/plant1.png','images/plant2.png',
    'images/plant3.png','images/plant4.png','images/plant5.png',
    'images/plant6.png','images/plant7.png','images/plant8.png',
    'images/plant9.png'

  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 2,
                child: custom_field(
                    label: 'Search',
                    controller: search_controller,
                    prefixicon: Icon(Icons.search_outlined),
                    surfixneed: false)),
            Expanded(
              child: Row(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Text(
                          'SaadAli',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Karachi',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('images/profilePic.jpg'),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        )),
        SizedBox(
          height: 30,
        ),
        // Carousel Section
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: Column(
            children: [
              CarouselSlider.builder(
                  itemCount: images.length,
                  itemBuilder: (context, index, realIndex) {
                    return GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("${names[index]}")));
                      },
                      child: Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          width: double.infinity,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.6),
                                  BlendMode.darken),
                              image: NetworkImage('${images[index]}'),
                              fit: BoxFit.cover,
                            ),
                          )),
                    );
                  },
                  options: CarouselOptions(
                      viewportFraction: 1,
                      autoPlay: true,
                      autoPlayCurve: Curves.easeInOut,
                      scrollDirection: Axis.horizontal,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 1000)))
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(

          "RECOMMENDATIONS",
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),

        ),
        SizedBox(
          height: 10,
        ),
        // Recommendation section
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          height: 350,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 350,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: recom_images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DescriptionScreen(),));
                      },
                      child: Container(
                        child: Stack(
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Card(
                                    child: Container(
                                      height: 300,
                                      width: 200,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 200,
                                            // width: double.infinity,

                                            decoration: BoxDecoration(
                                                color: MyColors.card_light_color1,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(70),
                                                    bottomRight:
                                                        Radius.circular(200))),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 3, horizontal: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                // crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'data1',
                                                          style: GoogleFonts.poppins(
                                                              fontSize: 14,
                                                              color: MyColors
                                                                  .heading_color),
                                                        ),
                                                        Text(
                                                          'data2',
                                                          style: GoogleFonts.poppins(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight.w600,
                                                              color: MyColors
                                                                  .heading_color),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.symmetric(
                                                        vertical: 5,
                                                        horizontal: 10),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: MyColors
                                                          .card_light_color2,
                                                    ),
                                                    child: Text(
                                                      '\$500',
                                                      style: GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                child: Image(
                                    width: 200,
                                    height: 200,
                                    image: AssetImage(recom_images[index])),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        //Top Products Section
        Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Products',
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'View All',
                    style: GoogleFonts.poppins(
                        fontSize: 14, color: MyColors.button_color),
                  )
                ],
              ),
            ),

            ///Product Card
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 350,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: mainImages.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 0,horizontal: 5),
                          child: Card(
                            child: Container(
                              // padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: MyColors.card_light_color1,
                                    ),
                                    width: 200,
                                    height: 200,
                                    child: Image(
                                      width: 200,
                                      height: 200,
                                      image: AssetImage('${mainImages[index]}'),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                    EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Marigold',
                                          style: GoogleFonts.poppins(
                                              fontSize: 16, fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          'Angiosperms',
                                          style: GoogleFonts.poppins(
                                              fontSize: 16, fontWeight: FontWeight.w400),
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.circle, size: 8,color: Colors.green,),
                                            SizedBox(width: 4,),
                                            Text(
                                              'Stock',
                                              style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '\$100',
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              color: MyColors.button_color,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),



          ],
        ))
      ]),
    );
  }
}
