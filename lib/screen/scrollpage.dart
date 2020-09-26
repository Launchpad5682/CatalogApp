import 'package:provider/provider.dart';
import './bloc.dart';
import 'package:catalog_app/screen/bloc.dart';
import 'package:flutter/material.dart';
import '../API/picture.dart';
import 'package:google_fonts/google_fonts.dart';

class ScrollPage extends StatefulWidget {
  ScrollPage({Key key}) : super(key: key);

  @override
  _ScrollPageState createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  List<Photos> photos;
  List<int> maxPhotos = [];

  @override
  void initState() {
    super.initState();
    maxPhotos.addAll(List.generate(100, (x) => x));
    photos = [];
  }

  bool onNotification(ScrollNotification scrollInfo, PhotoBloc bloc) {
    print(scrollInfo);
    if (scrollInfo is OverscrollNotification) {
      bloc.sink.add(scrollInfo);
    }
    return false;
  }

  Widget buildListView(BuildContext context,
      AsyncSnapshot<List<Photos>> snapshot, MediaQueryData mediaQueryData) {
    if (!snapshot.hasData) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    photos.addAll(snapshot.data);
    return ListView.builder(
      itemCount: (maxPhotos.length > photos.length)
          ? photos.length + 1
          : photos.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => (index == photos.length)
          ? Container(
              margin: EdgeInsets.all(8),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: mediaQueryData.size.height * 0.05,
                  vertical: mediaQueryData.size.width * 0.05,
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      20.0,
                    ),
                  ),
                  shadowColor: Colors.black,
                  elevation: 30.0,
                  child: Container(
                    height: mediaQueryData.size.height * 0.6,
                    width: mediaQueryData.size.width * 0.7,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            /*
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                        photos: photos[index],
                                      ),
                                    ),
                                  ),
                                   */
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                  20.0,
                                ),
                                topRight: Radius.circular(
                                  20.0,
                                ),
                              ),
                              child: Image.network(
                                Uri.encodeFull(
                                  photos[index].small_url,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                          width: double.infinity,
                          child: Text(
                            'Amazing Artist',
                            style: GoogleFonts.satisfy(fontSize: 30.0),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(Icons.ac_unit),
                            Icon(Icons.ac_unit),
                            Icon(Icons.ac_unit),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<PhotoBloc>(context);
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    print("ScrollPage called");
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) => onNotification(notification, bloc),
        child: StreamBuilder<List<Photos>>(
          stream: bloc.stream,
          builder: (context, snapshot) {
            return buildListView(context, snapshot, mediaQueryData);
          },
        ),
      ),
    );
  }
}
