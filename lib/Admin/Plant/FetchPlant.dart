import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testing_build/Admin/Plant/AddPlant.dart';
import 'package:testing_build/reusable_widget/colors.dart';

import '../../reusable_widget/text_widget.dart';

class PLantFetch extends StatefulWidget {
  const PLantFetch({super.key});

  @override
  State<PLantFetch> createState() => _PLantFetchState();
}

class _PLantFetchState extends State<PLantFetch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => PlantAdd(),));
      },
          child: Center(child: Icon(Icons.add,color: MyColors.heading_color,),),
          backgroundColor: MyColors.background_color),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 20,),
              text_custome(text: "Fetching Plants", size: 16, fontWeight: FontWeight.w600),
              SizedBox(height: 20,),

              StreamBuilder(
                stream: FirebaseFirestore.instance.collection("Plants").snapshots(),
                builder: (context, snapshot) {

                  if(snapshot.hasData){
                    var plantmap1 = snapshot.data!.docs;
                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const ScrollPhysics(),
                      itemCount: plantmap1.length,
                      itemBuilder: (context, index) {
                        var plantmap = snapshot.data!.docs[index];
                        // print(snapshot.data!.docs[index]['Plant-Name']);
                        // Map<String, dynamic> plantmap = snapshot.data!.docs[index].data as Map<String, dynamic>;
                        // Main Container
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                          width: double.infinity,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: MyColors.background_color.withOpacity(0.4),
                          ),
                          child: Row(
                            children: [

                              SizedBox(width: 10,),

                              // Image Container

                              Container(
                                width: 80,
                                height: 100,
                                decoration: BoxDecoration(
                                    color: MyColors.button_color,
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage('images/register.jpg'))
                                ),
                              ),

                              SizedBox(width: 10,),

                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Plant Name
                                  Container(
                                    width: 120,
                                    height: 24,
                                    child: text_custome(text: "${plantmap["Plant-Name"]}", size: 18, fontWeight: FontWeight.w600),
                                  ),

                                  SizedBox(height: 3,),
                                  // Category

                                  Container(
                                    width: 120,
                                    height: 20,
                                    child: text_custome(text: "${plantmap["Plant-Category"]}", size: 14, fontWeight: FontWeight.w600),
                                  ),


                                  SizedBox(height: 3,),
                                  // Price

                                  Container(
                                    width: 120,
                                    height: 24,
                                    child: text_custome(text: "${plantmap["Plant-Price"]}", size: 14, fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),

                              SizedBox(width: 34,),

                              // Update Button

                              GestureDetector(
                                onTap: (){
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Updated")));
                                },
                                child: Container(
                                  width: 34,
                                  height: 34,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white
                                  ),
                                  child: Center(child:Icon(Icons.update,color: MyColors.heading_color,),),
                                ),
                              ),

                              SizedBox(width: 6,),

                              // Update Button

                              GestureDetector(
                                onTap: (){
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Deleted")));
                                },
                                child: Container(
                                  width: 34,
                                  height: 34,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white
                                  ),
                                  child: Center(child:Icon(Icons.delete,color: Colors.red.shade400,),),
                                ),
                              )

                            ],
                          ),
                        );
                      },);
                  }
                  if(snapshot.hasError){
                    return Center(child: Icon(Icons.error),);
                  }
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return CircularProgressIndicator();
                  }
                  return Container();

              },)
            ],
          ),
        ),
      )
    );
  }
}
