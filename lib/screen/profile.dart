import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 400.0,
            width: 400.0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 15.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    20.0,
                  ),
                ),
                shadowColor: Colors.black,
                elevation: 25.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    'assets/profile.jpeg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Text(
            'Saurabh Suthar',
            style: GoogleFonts.satisfy(color: Colors.white, fontSize: 30.0),
          ),
          Text(
            'Flutter Developer',
            style: GoogleFonts.abel(color: Colors.white, fontSize: 15.0),
          ),
          SizedBox(
              width: mediaQueryData.size.width * 0.8,
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.ac_unit),
                    Text(
                      'GitHub',
                      style:
                          GoogleFonts.abel(color: Colors.white, fontSize: 20.0),
                    ),
                  ],
                ),
                color: Colors.pink[100],
                elevation: 15.0,
              ))
        ],
      ),
    );
  }
}
