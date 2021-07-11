import 'package:flutter/material.dart';
import 'package:flutter_api2/model/details_api.dart';
import 'package:flutter_api2/screens/details_movie.dart';
import 'package:flutter_api2/services/connect_api.dart';

class MovDesc extends StatefulWidget {
  final TextEditingController titleController;
  final ConnectAPI connectAPI;
  final DetailsAPI detailsAPI;

  MovDesc({
    @required this.titleController,
    @required this.connectAPI,
    @required this.detailsAPI,
  });

  @override
  _MovDescState createState() => _MovDescState();
}

class _MovDescState extends State<MovDesc> {
  TextEditingController titleController;
  ConnectAPI connectAPI;
  DetailsAPI detailsAPI;
  var titleAPI;

  @override
  Widget build(BuildContext context) {
    titleController = widget.titleController;
    connectAPI = widget.connectAPI;
    detailsAPI = widget.detailsAPI;
    titleAPI = titleController.text;
    return new Container(
      width: double.infinity,
      height: 220,
      margin: new EdgeInsets.symmetric(horizontal: 20),
      // color: Colors.green,
      child: Center(
        child: new Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          color: Colors.teal[100],
          elevation: 15,
          child: new Column(
            children: [
              Container(
                margin: new EdgeInsets.symmetric(vertical: 10),
                child: new ListTile(
                  title: Row(
                    children: [
                      new SizedBox(
                        height: 160,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: new Image(
                            image: NetworkImage(
                              (detailsAPI.poster != null)
                                  ? detailsAPI.poster.toString()
                                  : "https://yt3.ggpht.com/ytc/AKedOLQybyN1mVv2t2XhNQKweDRXwqdf6t6sAHZWwh19Zdw=s900-c-k-c0x00ffffff-no-rj",
                            ),
                            fit: BoxFit.cover,
                            width: 100,
                          ),
                        ),
                      ),
                      new Flexible(
                        child: new Padding(
                          padding: new EdgeInsets.only(left: 10),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.justify,
                              ),
                              new SizedBox(
                                height: 5,
                              ),
                              new InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      connectAPI
                                          .getData(titleAPI)
                                          .then((value) {
                                        detailsAPI = value;
                                        setState(() {});
                                      });
                                      return DetailsMovie(
                                          detailsAPI: detailsAPI);
                                    }),
                                  );
                                },
                                child: new Text(
                                  "See Details >>>",
                                  style: new TextStyle(
                                    color: Colors.blue[700],
                                    fontSize: 15,
                                  ),
                                  // textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
