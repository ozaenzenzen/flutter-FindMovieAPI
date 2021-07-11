import 'package:flutter/material.dart';
import 'package:flutter_api2/model/details_api.dart';
import 'package:flutter_api2/services/connect_api.dart';
import 'package:flutter_api2/widget/card_movie.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ConnectAPI connectAPI = ConnectAPI();
  DetailsAPI detailsAPI = DetailsAPI();

  final titleController = TextEditingController();
  bool isSearching = false;

  var titleAPI;
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
      ),
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            //Cari Film Favoritmu
            new Container(
              padding: new EdgeInsets.symmetric(horizontal: 5),
              width: double.infinity,
              margin: new EdgeInsets.symmetric(horizontal: 20),
              child: Column(
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
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 1,
                      offset: Offset(0, 7),
                      blurRadius: 8,
                      color: Colors.black26,
                    ),
                  ],
                ),
                margin: new EdgeInsets.symmetric(horizontal: 20),
                child: new TextFormField(
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (term) {
                    if (formKey.currentState.validate()) {
                      titleAPI = titleController.text;
                      connectAPI.getData(titleAPI).then((value) {
                        detailsAPI = value;
                        setState(() {});
                      });
                    }
                  },
                  controller: titleController,
                  decoration: new InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: (titleController.text.isNotEmpty)
                        ? IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () => titleController.clear(),
                          )
                        : null,
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
                  FocusScope.of(context).unfocus();
                  if (formKey.currentState.validate()) {
                    // connectAPI.t = titleController.toString();
                    titleAPI = titleController.text;
                    connectAPI.getData(titleAPI).then((value) {
                      detailsAPI = value;
                      print(detailsAPI.title);
                      setState(() {});
                    });
                  }
                },
              ),
            ),
            new SizedBox(height: 20),

            //Text = Hasil Pencarian Disini
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 20),
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

            FutureBuilder(
              // initialData: detailsAPI,
              future: connectAPI.getData(titleAPI),
              builder:
                  (BuildContext context, AsyncSnapshot<DetailsAPI> snapshot) {
                if (snapshot.hasData) {
                  return MovDesc(
                    titleController: titleController,
                    connectAPI: connectAPI,
                    detailsAPI: detailsAPI,
                  );
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
