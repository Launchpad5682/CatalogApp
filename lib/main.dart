import 'package:catalog_app/screen/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'themes.dart';
import './screen/homepage.dart';
import './animatedwidgets/custom_drawer.dart';
import 'package:provider/provider.dart';
import './screen/bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => CustomDrawer.of(context).open(),
          );
        },
      ),
      title: Text(
        'Catalog App',
        style: GoogleFonts.satisfy(
          color: Colors.white,
          fontSize: 20.0,
        ),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0))),
    );
    Widget child = HomePage(appBar: appBar);

    child = CustomDrawer(child: child);

    return Provider<PhotoBloc>(
      create: (context) => PhotoBloc(),
      dispose: (context, bloc) => bloc.dispose(),
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Catalog App',
        theme: ThemeData(
          primaryColor: pallete_3,
          accentColor: pallete_2,
          backgroundColor: pallete_4,
          iconTheme: IconThemeData(
            color: pallete_3,
            opacity: 1.0,
          ),
        ),
        home: child,
      ),
    );
  }
}
