import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_build/Admin/AdminHome.dart';
import 'package:testing_build/HomeScreen.dart';
import 'package:testing_build/RegisterScreen.dart';
import 'package:testing_build/reusable_widget/colors.dart';
import 'package:testing_build/reusable_widget/reusable_textformfield.dart';
import 'package:testing_build/reusable_widget/text_widget.dart';

import 'UserMain/main_home_navbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool ischeck = true;

  final _email = TextEditingController();
  final _pass = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    _email.dispose();
    _pass.dispose();
    super.dispose();
  }

  void loginuser()async{
    try{
      UserCredential userCredential =  await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email.text.toString(), password: _pass.text.toString());
        if(FirebaseAuth.instance.currentUser!.email=="admin@gmail.com"){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AdminScreen(),));
        }
        else{
          Navigator.push(context, MaterialPageRoute(builder: (context) => MainHome(),));
        }
      } on FirebaseAuthException catch(ex){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${ex.code.toString()}")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          scrollDirection: Axis.vertical,
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
                        image: AssetImage('images/register.jpg'))
                  ),
                ),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(250)),
              ),

              SizedBox(
                height: 60,
              ),

              Center(
                child: text_custome(
                  color: MyColors.heading_color,
                  fontWeight: FontWeight.w600,
                  size: 24,
                  text: "Welcome Back",
                ),
              ),

              SizedBox(height: 40,),

              // Text Fields


              Form(
                  key: _key,
                  child: Column(

                children: [
                  custom_field(label: "Enter Your Email",controller: _email,Errormsg: "Email is Required", prefixicon: Icon(Icons.email), surfixneed: false),

                  SizedBox(height: 20,),

                  custom_field(label: "Enter Your Password",controller: _pass,Errormsg:  "Password is Required", prefixicon: Icon(Icons.key), surfixneed: true,surfixIcon: IconButton(onPressed: (){setState(() {
                    ischeck = !ischeck;
                  });},icon: ischeck==false?Icon(Icons.panorama_fish_eye):Icon(Icons.remove_red_eye)),ispassword: ischeck==false?false:true,),


                  SizedBox(height: 20,),

                  GestureDetector(
                    onTap: (){
                     if(_key.currentState!.validate()){
                        loginuser();
                        _email.clear();
                        _pass.clear();
                     }
                    },
                    child: Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: MyColors.button_color
                      ),
                      child: Center(child: text_custome(text: "Login", size: 14, fontWeight: FontWeight.w400,color: Colors.white),),
                    ),
                  ),
                ],
              )),

              SizedBox(height: 20,),

              GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => REgisterScreen(),));
                  },
                  child: text_custome(text: "Create An Account", size: 14, fontWeight: FontWeight.w300))

            ],
          ),
        ),
      ),
    );
  }
}




