import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testing_build/reusable_widget/colors.dart';
import 'package:testing_build/reusable_widget/reusable_textformfield.dart';
import 'package:testing_build/reusable_widget/text_widget.dart';

class PlantAdd extends StatefulWidget {
  const PlantAdd({super.key});

  @override
  State<PlantAdd> createState() => _PlantAddState();
}

class _PlantAddState extends State<PlantAdd> {


  final _name = TextEditingController();
  final _cat = TextEditingController();
  final _desc = TextEditingController();
  final _qty = TextEditingController();
  final _price = TextEditingController();
  final _growth = TextEditingController();

  void _addplant()async{
    Map<String, dynamic> plantadd = {
      "Plant-Name":_name.text.toString(),
      "Plant-Category":_cat.text.toString(),
      "Plant-Description":_desc.text.toString(),
      "Plant-Quantity":_qty.text.toString(),
      "Plant-Price":_price.text.toString(),
      "Plant-Growth":_growth.text.toString(),
    };

    await FirebaseFirestore.instance.collection("Plants").add(plantadd);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data Inserted")));
    setState(() {
      Navigator.pop(context);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _name.dispose();
    _cat.dispose();
    _desc.dispose();
    _qty.dispose();
    _price.dispose();
    _growth.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Form(
              child: Column(
            children: [

              SizedBox(height: 40,),

              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: MyColors.background_color,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/register.jpg'))
                ),
              ),

              SizedBox(height: 20,),

              custom_field(label: "Plant Name", controller: _name, prefixicon: Icon(Icons.drive_file_rename_outline), surfixneed: false),

              SizedBox(height: 20,),

              custom_field(label: "Category", controller: _cat, prefixicon: Icon(Icons.category), surfixneed: true),

              SizedBox(height: 20,),

              custom_field(label: "Description", controller: _desc, prefixicon: Icon(Icons.list), surfixneed: true),

              SizedBox(height: 20,),

              custom_field(label: "Quantity", controller: _qty, prefixicon: Icon(Icons.production_quantity_limits), surfixneed: true),

              SizedBox(height: 20,),

              custom_field(label: "Price", controller: _price, prefixicon: Icon(Icons.price_check), surfixneed: true),

              SizedBox(height: 20,),

              custom_field(label: "Growth Habit", controller: _growth, prefixicon: Icon(Icons.upgrade_sharp), surfixneed: true),

              SizedBox(height: 20,),

              GestureDetector(
                onTap: (){
                  _addplant();
                  _name.clear();
                  _cat.clear();
                  _desc.clear();
                  _qty.clear();
                  _price.clear();
                  _growth.clear();
                },
                child: Container(
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: MyColors.button_color
                  ),
                  child: Center(child: text_custome(text: "Add Plant",fontWeight: FontWeight.w600,size: 14,color: Colors.white),),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
