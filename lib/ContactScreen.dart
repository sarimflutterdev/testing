import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_build/LoginScreen.dart';
import 'package:testing_build/reusable_widget/colors.dart';
import 'package:testing_build/reusable_widget/reusable_textformfield.dart';
import 'package:testing_build/reusable_widget/text_widget.dart';
class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();

}

class _ContactScreenState extends State<ContactScreen> {

  final _sendername= TextEditingController();
  final _senderemail=TextEditingController();
  final _sendermessage=TextEditingController();

  void signout()async{
    await FirebaseAuth.instance.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(

            decoration:BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/contactscreenbg3.jpg'),
                fit: BoxFit.cover
              )
            ),
            height: double.infinity,
              child: Stack(
                children:[
                  Center(
                  child: Container(
                     width: 300,
                    height: 500,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(21),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 30,),
                        text_custome(text: 'Get In Touch', size: 24, fontWeight: FontWeight.w600),
                        SizedBox(height: 5,),
                        text_custome(text: 'FEEL FREE TO DROP US A MESSAGE ', size: 12, fontWeight: FontWeight.w300),
                        SizedBox(height: 20,),
                        custom_field(label: 'Name', controller: _sendername, prefixicon: Icon(Icons.person), surfixneed: true),
                        SizedBox(height: 10,),
                        custom_field(label: 'Email', controller: _senderemail, prefixicon: Icon(Icons.email_rounded), surfixneed: true),
                        SizedBox(height: 10,),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 25),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(21),
                              color: Colors.grey.shade300
                          ),
                          child:Column(
                            children: [
                              Row(children: [
                                Icon(Icons.message,size: 22,),
                                SizedBox(width: 10,),
                                text_custome(text: "Message", size: 16, fontWeight: FontWeight.w400,color: Colors.grey.shade600,)
                              ],),
                              TextFormField(
                                controller: _sendermessage,
                                decoration: InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                ),
                                maxLines: 3,
                              )
                            ],
                          )
                        ),
                          SizedBox(height: 100,),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(21)
                              ),
                              backgroundColor: MyColors.button_color
                            ),

                              onPressed: (){
                                  signout();
                              }, child: Padding(
                                padding: const EdgeInsets.only(left: 15,right: 15,bottom: 8,top: 8),
                                child: text_custome(text: 'Submit',size: 18,fontWeight: FontWeight.w400,),
                              ))
                      ],
                    ),
                  ),
                ),
                ]
              ),
            ),

    );
  }
}

// Container(
// width: double.infinity,
// child: Chewie(
// controller: chewieController!,
// ),
// )



