import 'package:catalog_app/API/calling_data.dart';
import 'package:catalog_app/API/picture.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'detailpage.dart';

class Search extends StatefulWidget {
  Search({@required this.keyword});
  String keyword;

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    HttpService httpService = HttpService();
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: FutureBuilder(
          future: httpService.searchPhotos(widget.keyword),
          builder:
              (BuildContext context, AsyncSnapshot<List<SearchPhotos>> snapshot) {
            if (snapshot.hasData) {
              List<SearchPhotos> photos = snapshot.data;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: photos.length,
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
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                        photos: photos[index],
                                      ),
                                    ),
                                  ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
          }),
    );
  }
}
