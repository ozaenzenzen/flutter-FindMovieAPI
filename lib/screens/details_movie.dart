import 'package:flutter/material.dart';
import 'package:flutter_api2/model/details_api.dart';

class DetailsMovie extends StatelessWidget {
  final DetailsAPI detailsAPI;

  DetailsMovie({this.detailsAPI});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        elevation: 0,
        title: new Text(
          detailsAPI.title.toString() + " (" + detailsAPI.year.toString() + ")",
          style: new TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: "SF",
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: new Container(
        margin: new EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: new Column(
          children: [
            new Row(
              children: [
                new SizedBox(
                  height: 250,
                  child: new ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: new Image(
                      image: NetworkImage(
                        (detailsAPI.poster != null)
                            ? detailsAPI.poster.toString()
                            : "https://seojasa.com/wp-content/uploads/2019/08/error-404.jpg",
                      ),
                    ),
                  ),
                ),
                new SizedBox(width: 20),
                new Flexible(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(
                        (detailsAPI != null)
                            ? detailsAPI.title.toString() +
                                " (" +
                                detailsAPI.year.toString() +
                                ")"
                            : "Tidak Ada Data Judul",
                        style: new TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: "SF",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      new SizedBox(
                        height: 10,
                      ),
                      new Text(
                        (detailsAPI != null)
                            ? detailsAPI.plots.toString()
                            : "Tidak Ada Data Deskripsi",
                        style: new TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: "SF",
                          // fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      new SizedBox(
                        height: 10,
                      ),
                      new Text(
                        (detailsAPI != null)
                            ? detailsAPI.genre.toString()
                            : "Tidak Ada Data Deskripsi",
                        style: new TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: "SF",
                          // fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      new SizedBox(
                        height: 10,
                      ),
                      new Text(
                        (detailsAPI != null)
                            ? detailsAPI.released.toString()
                            : "Tidak Ada Data Deskripsi",
                        style: new TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: "SF",
                          // fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      new SizedBox(
                        height: 10,
                      ),
                      new Text(
                        (detailsAPI != null)
                            ? detailsAPI.rated.toString()
                            : "Tidak Ada Data Deskripsi",
                        style: new TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: "SF",
                          // fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      new SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
