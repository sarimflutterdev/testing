import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          top: true,
          child: EditProfileBody()),
    );
  }
}
class EditProfileBody extends StatefulWidget {
  const EditProfileBody({super.key});

  @override
  State<EditProfileBody> createState() => _EditProfileBodyState();
}

class _EditProfileBodyState extends State<EditProfileBody> {
  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.symmetric(horizontal: 20),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          SizedBox(
            height: 40,
          ),
          Text("Edit Profile",style: GoogleFonts.poppins(
            color: Color(0xff386a24),
            fontSize: 24,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          ),),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage('https://pbs.twimg.com/media/FjU2lkcWYAgNG6d.jpg'),
                ),
              ),
              SizedBox(width: 10,),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Saad',style: GoogleFonts.poppins(
                      fontSize: 14
                    ),),
                    Text('saad123@gmail.com',style: GoogleFonts.poppins(
                        fontSize: 14
                    ),),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 2,horizontal: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff98e3ac),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.edit),
                          SizedBox(width: 5,),
                          Text("Edit Profile",style: GoogleFonts.poppins(
                              fontSize: 14
                          ),)
                        ],
                      ),
                    )
                    // ListTile(
                    //   leading: Icon(Icons.edit),
                    //   title: Text("Edit Profile"),
                    // )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          EditProfileWidget(
            text: "Orders",
            icon: FontAwesomeIcons.fax,
          ),
          SizedBox(
            height: 30,
          ),
          EditProfileWidget(
            text: "Address",
            icon: FontAwesomeIcons.addressCard,
          ),
          SizedBox(
            height: 30,
          ),
          EditProfileWidget(
            text: "Wallet",
            icon: FontAwesomeIcons.wallet,
          ),
          SizedBox(
            height: 30,
          ),
          EditProfileWidget(
            text: "Setting",
            icon: FontAwesomeIcons.gear,
          ),
          SizedBox(
            height: 30,
          ),
          EditProfileWidget(
            text: "Sign Out",
            icon: FontAwesomeIcons.signOut,
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}

class EditProfileWidget extends StatelessWidget {
 IconData icon;
 String text;


 EditProfileWidget({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xff98e3ac),
      ),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon),
            SizedBox(width: 20,),
            Expanded(
              child: Text('$text',style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600
              ),),
            )
          ],
        ),
      ),
    );
  }
}

