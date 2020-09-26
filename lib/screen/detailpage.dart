import 'package:catalog_app/API/picture.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatefulWidget {
  SearchPhotos photos;
   
  DetailPage({this.photos});
  @override
  _DetailPageState createState() => _DetailPageState(photos: photos);
}

class _DetailPageState extends State<DetailPage> {
  SearchPhotos photos;
  _DetailPageState({this.photos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Image.network(
              Uri.encodeFull(photos.full_url),
              fit: BoxFit.fitWidth,
            ),
            Text(
              'Artist Name',
              style: GoogleFonts.satisfy(color: Colors.red, fontSize: 40.0),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 30.0,
            ),
            RaisedButtonCustom(
              text4button: 'Set as Wallpaper',
              buttoncolor: Colors.blue,
              textColor: Colors.white,
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButtonCustom(
              text4button: 'Download Image',
              buttoncolor: Colors.pink,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class RaisedButtonCustom extends StatelessWidget {
  String text4button;
  Color buttoncolor;
  Color textColor;

  RaisedButtonCustom({
    @required this.text4button,
    @required this.buttoncolor,
    @required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        height: 40.0,
        width: double.infinity,
        child: RaisedButton(
          onPressed: () {},
          color: buttoncolor,
          elevation: 10.0,
          child: Text(
            text4button,
            style: GoogleFonts.satisfy(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
