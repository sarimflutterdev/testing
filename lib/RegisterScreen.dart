import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:testing_build/LoginScreen.dart';
import 'package:testing_build/Reegistration/Register_Login.dart';
import 'package:testing_build/reusable_widget/colors.dart';
import 'package:testing_build/reusable_widget/reusable_textformfield.dart';
import 'package:testing_build/reusable_widget/text_widget.dart';

class REgisterScreen extends StatefulWidget {
  const REgisterScreen({super.key});

  @override
  State<REgisterScreen> createState() => _REgisterScreenState();
}

class _REgisterScreenState extends State<REgisterScreen> {

  bool ischeck = true;

  final _email = TextEditingController();
  final _name = TextEditingController();
  final _pass = TextEditingController();
  final _age = TextEditingController();
  final _gender = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    _email.dispose();
    _name.dispose();
    _pass.dispose();
    _age.dispose();
    _gender.dispose();
    super.dispose();
  }


  void addinguser()async{
    Map<String,dynamic> adduser = {
      "User-Name":_name.text.toString(),
      "User-Gender":_gender.text.toString(),
      "User-Age":_age.text.toString(),
      "User-Email":_email.text.toString(),
      "User-Password":_pass.text.toString(),
    };

    await FirebaseFirestore.instance.collection("Users").add(adduser);
  }

  void registerUser() async{
    try{
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email.text.toString(), password: _pass.text.toString());

      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));

    }on FirebaseAuthException catch(ex){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${ex.code.toString()}")));
    }
  }

  void mail_sender()async{
    final Email email_sender = Email(
      body: "Thank you for choosing Plantix! We're delighted to have you as part of our community. Your account has been successfully created on our mobile app. Get ready to explore a world of plant care and gardening tips. Happy growing with Plantix!",
      subject: "Hey! Thanks For Creating An Account",
      recipients: ["${_email.text.toString()}"],
      cc: ["${_email.text.toString()}"],
      isHTML: false,
    );

    try{
      await FlutterEmailSender.send(email_sender);
    }catch(error){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${error.toString()}")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
          top: true,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const ScrollPhysics(),
            child: Column(
              children: [
                ClipRRect(
                  child: Container(
                    width: double.infinity,
                    height: 240,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('images/login.jpg'))
                    ),
                  ),
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(250)),
                ),

                SizedBox(
                  height: 30,
                ),

                Center(
                  child: text_custome(
                    color: MyColors.heading_color,
                    fontWeight: FontWeight.w600,
                    size: 24,
                    text: "Register Yourself",
                  ),
                ),

                SizedBox(height: 20,),

                // Text Fields


                Form(child: Column(
                  key: _key,
                  children: [
                    custom_field(label: "Enter Your FullName", controller: _name, prefixicon: Icon(Icons.person), surfixneed: true),
                    SizedBox(height: 10,),
                    custom_field(label: "Enter Your Age", controller: _age, prefixicon: Icon(Icons.calendar_month), surfixneed: true),
                    SizedBox(height: 10,),
                    custom_field(label: "Enter Your Gender", controller: _gender, prefixicon: Icon(Icons.male), surfixneed: true),
                    SizedBox(height: 10,),
                    custom_field(label: "Enter Your Email",controller: _email,Errormsg: "Email is Required", prefixicon: Icon(Icons.email), surfixneed: false),
                    SizedBox(height: 10,),
                    custom_field(label: "Enter Your Password",controller: _pass,Errormsg:  "Password is Required", prefixicon: Icon(Icons.key), surfixneed: true,surfixIcon: IconButton(onPressed: (){setState(() {
                      ischeck = !ischeck;
                    });},icon: ischeck==false?Icon(Icons.panorama_fish_eye):Icon(Icons.remove_red_eye)),ispassword: ischeck==false?false:true,),


                    SizedBox(height: 20,),

                    GestureDetector(
                      onTap: (){
                        registerUser();
                        addinguser();
                        mail_sender();
                        _email.clear();
                        _pass.clear();
                        _name.clear();
                      },
                      child: Container(
                        width: 120,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: MyColors.button_color
                        ),
                        child: Center(child: text_custome(text: "Register", size: 14, fontWeight: FontWeight.w400,color: Colors.white),),
                      ),
                    ),
                  ],
                )),

                SizedBox(height: 20,),

                GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                    },
                    child: text_custome(text: "Already Have an Account! Login", size: 14, fontWeight: FontWeight.w300))

              ],
            ),
          )),
    );
  }
}
