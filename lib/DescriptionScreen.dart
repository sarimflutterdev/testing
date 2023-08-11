import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_build/reusable_widget/colors.dart';
import 'package:testing_build/reusable_widget/text_widget.dart';

class DescriptionScreen extends StatefulWidget {
  const DescriptionScreen({super.key});

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  int count = 0;
  var price=40;
  var plant_name="'Do Cacti & Succulents'";
  var plant_img="images/plant1.jpg";
  var plant_category="In Door Plant";
  var plant_growth=" it takes most roses 3-4 years to reach their mature size and maximum bloom production";
  var plant_description="A plant is a living thing that grows in the earth and has a stem, leaves, and roots. Water each plant as often as required. ... exotic plants. Synonyms: flower, bush, vegetable, herb More Synonyms of plant.";
  void increment() {
    count++;
    setState(() {});
  }

  void decrement() {
    count--;
    setState(() {});
  }

  var _category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Positioned(
                    child: Container(
                      width: double.infinity,
                      height: 240,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(21),
                            bottomRight: Radius.circular(21)),
                        color: MyColors.background_color.withOpacity(0.4),
                        image: DecorationImage(
                            image: AssetImage('${plant_img}'),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 18,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Positioned(
                      top: 30,
                      right: 30,
                      child: Icon(
                        Icons.heart_broken,
                        size: 16,
                        color: Colors.red,
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text_custome(
                      text: '${plant_name}',
                      size: 24.0,
                      fontWeight: FontWeight.w600),
                  text_custome(

                      text: '${plant_category}',
                      size: 16.0,
                      fontWeight: FontWeight.w400),
                  SizedBox(
                    height: 20,
                  ),
                  text_custome(text: 'Description', size: 16.0, fontWeight: FontWeight.w600),
                  SizedBox(height: 5,),
                  text_custome(
                      text:'${plant_description}',
                          size: 14,
                      fontWeight: FontWeight.w400)
                ],
              ),
              SizedBox(
                height: 30,
              ),
              text_custome(text: 'Price : \$${price}', size: 16, fontWeight: FontWeight.w600),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  text_custome(
                      text: "Quantity :", size: 14, fontWeight: FontWeight.w600),
                  Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.black)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {
                              if (count <= 0) {
                              } else {
                                decrement();
                              }
                            },
                            icon: Icon(Icons.remove)),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 12, right: 12, top: 2, bottom: 2),
                          child: Text('${count}'),
                        ),
                        IconButton(
                            onPressed: () {
                              increment();
                            },
                            icon: Icon(Icons.add))
                      ],
                    ),
                  ),

                ],
              ),
              SizedBox(height: 20,),
              text_custome(text: 'Plant Growth: ', size: 16, fontWeight: FontWeight.w600),
              text_custome(text:'${plant_growth}' , size: 14, fontWeight: FontWeight.w400),
              SizedBox(height: 30,),
              ElevatedButton(

                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.button_color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11),
                  )
                ),
                  onPressed: (){}, child: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15,bottom: 8,top: 8),
                    child: text_custome(text:'Add to Cart',size: 14,fontWeight: FontWeight.w400),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
