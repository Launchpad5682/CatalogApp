/*
import 'package:flutter/material.dart';
import '../API/picture.dart';
import 'detailpage.dart';
import 'package:google_fonts/google_fonts.dart';
import '../API/calling_data.dart';

class ScrollPage extends StatefulWidget {
  ScrollPage({Key key}) : super(key: key);

  @override
  _ScrollPageState createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  final HttpService httpService = HttpService();
  ScrollController _scrollController = ScrollController();

  Future<List<Photos>> futurephotos;

  @override
  void initState() {
    futurephotos = httpService.fetchPhotos();
    super.initState();
    _scrollController.addListener(() {
      print(_scrollController.position.pixels);
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          futurephotos = httpService.fetchPhotos();
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return FutureBuilder(
      future: futurephotos,
      builder: (BuildContext context, AsyncSnapshot<List<Photos>> snapshot) {
        if (snapshot.hasData) {
          List<Photos> photos = snapshot.data;
          return ListView.builder(
            controller: _scrollController,
            itemCount: photos.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Center(
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
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

 */