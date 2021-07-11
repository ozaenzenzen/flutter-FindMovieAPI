import 'package:flutter/material.dart';
import 'package:flutter_api2/model/details_api.dart';
import 'package:flutter_api2/screens/details_movie.dart';
import 'package:flutter_api2/services/connect_api.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

bool isSearching = false;
final titleController = TextEditingController();

var titleAPI;
// var titleAPI = "Avengers";
ConnectAPI connectAPI = ConnectAPI();
DetailsAPI detailsAPI = DetailsAPI();

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // var formKeyLocal;
  // _HomePageState({this.titleAPI});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: !isSearching
            ? new Text(
                "Home",
                style: new TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                    fontFamily: "SF",
                    fontWeight: FontWeight.w700),
              )
            : new TextField(
                decoration: new InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: "Search Movies Here",
                  hintStyle: new TextStyle(fontSize: 15),
                ),
              ),
        // actions: [
        //   isSearching
        //       ? IconButton(
        //           icon: Icon(
        //             Icons.cancel,
        //             color: Colors.black,
        //           ),
        //           onPressed: () {
        //             setState(() {
        //               isSearching = false;
        //             });
        //           },
        //         )
        //       : IconButton(
        //           icon: Icon(
        //             Icons.search,
        //             color: Colors.black,
        //           ),
        //           onPressed: () {
        //             setState(() {
        //               isSearching = true;
        //             });
        //           },
        //         ),
        // ],
      ),
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            //Cari Film Favoritmu
            new Container(
              padding: new EdgeInsets.symmetric(horizontal: 5),
              width: double.infinity,
              // height: 200,
              margin: new EdgeInsets.symmetric(horizontal: 20),
              // color: Colors.red,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  new Text(
                    "Cari Film \nFavoritmu!",
                    style: new TextStyle(
                      fontSize: 40,
                      fontFamily: "SF",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  new SizedBox(height: 5),
                  new Text(
                    "Banyak tersedia deskripsi dari film favoritmu",
                    style: new TextStyle(
                      fontSize: 16,
                      fontFamily: "SF",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            new SizedBox(height: 40),

            //Cari Disini!
            new Container(
              // height: 200,
              margin: new EdgeInsets.symmetric(horizontal: 20),
              // color: Colors.red,
              child: new Text(
                "Cari Disini!",
                style: new TextStyle(
                  fontSize: 20,
                  fontFamily: "SF",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            new SizedBox(height: 20),

            //Text Field Cari Film
            new Form(
              key: formKey,
              child: new Container(
                // height: 200,
                margin: new EdgeInsets.symmetric(horizontal: 20),
                // color: Colors.red,
                child: new TextFormField(
                  decoration: new InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: (titleController.text.isNotEmpty)
                        ? IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () => titleController.clear(),
                          )
                        : null,
                    // icon: Icon(Icons.search),
                    hintText: "Search Movies Here",
                    hintStyle: new TextStyle(fontSize: 15),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Harus Diisi!";
                    } else {
                      return null;
                    }
                  },
                  controller: titleController,
                ),
              ),
            ),
            new SizedBox(height: 20),

            //Search button
            new Container(
              width: 120,
              height: 50,
              margin: new EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan,
                ),
                child: new Text(
                  "Cari",
                  style: new TextStyle(
                    color: Colors.white,
                    fontFamily: "SF",
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    // connectAPI.t = titleController.toString();
                    titleAPI = titleController.text;
                    connectAPI.getData(titleAPI).then((value) {
                      detailsAPI = value;
                      setState(() {});
                    });
                  }
                },
              ),
            ),
            new SizedBox(height: 20),

            //Text = Hasil Pencarian Disini
            new Container(
              // height: 200,
              margin: new EdgeInsets.symmetric(horizontal: 20),
              // color: Colors.red,
              child: new Text(
                "Hasil Pencarian Disini",
                style: new TextStyle(
                  fontSize: 20,
                  fontFamily: "SF",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            new SizedBox(height: 20),

            //Hasil Film yang muncul
            new FutureBuilder(
              future: connectAPI.getData(titleAPI),
              builder:
                  (BuildContext context, AsyncSnapshot<DetailsAPI> snapshot) {
                if (snapshot.hasData) {
                  return MovDesc();
                } else {
                  return Container();
                }
              },
            ),
            new SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class MovDesc extends StatelessWidget {
  const MovDesc({
    Key key,
    // @required this.detailsAPI,
  }) : super(key: key);

  // final DetailsAPI detailsAPI;

  @override
  Widget build(BuildContext context) {
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
                              detailsAPI.poster.toString(),
                            ),
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
                                      titleAPI = titleController.text;
                                      connectAPI
                                          .getData(titleAPI)
                                          .then((value) {
                                        detailsAPI = value;
                                        // setState(() {});
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
