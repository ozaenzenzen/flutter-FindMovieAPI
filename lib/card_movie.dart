// import 'package:flutter/material.dart';
// import 'package:flutter_api2/connect_api.dart';
// import 'package:flutter_api2/details_api.dart';
// import 'package:flutter_api2/details_movie.dart';

// class MovDesc extends StatelessWidget {
//   MovDesc({
//     @required this.detailsAPI,
//     @required this.textController,
//     @required this.connectAPI,
//   });

//   var detailsAPI;
//   final TextEditingController textController;
//   final ConnectAPI connectAPI;

//   @override
//   Widget build(BuildContext context) {
//     return new Container(
//       width: double.infinity,
//       height: 220,
//       margin: new EdgeInsets.symmetric(horizontal: 20),
//       // color: Colors.green,
//       child: Center(
//         child: new Card(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12.0),
//           ),
//           color: Colors.teal[100],
//           elevation: 15,
//           child: new Column(
//             children: [
//               Container(
//                 margin: new EdgeInsets.symmetric(vertical: 10),
//                 child: new ListTile(
//                   title: Row(
//                     children: [
//                       new SizedBox(
//                         height: 160,
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(12.0),
//                           child: new Image(
//                             image: NetworkImage(
//                               detailsAPI.poster.toString(),
//                             ),
//                           ),
//                         ),
//                       ),
//                       new Flexible(
//                         child: new Padding(
//                           padding: new EdgeInsets.only(left: 10),
//                           child: new Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: <Widget>[
//                               new Text(
//                                 (detailsAPI != null)
//                                     ? detailsAPI.title.toString() +
//                                         " (" +
//                                         detailsAPI.year.toString() +
//                                         ")"
//                                     : "Tidak Ada Data Judul",
//                                 style: new TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 24,
//                                   fontFamily: "SF",
//                                   fontWeight: FontWeight.w700,
//                                 ),
//                               ),
//                               new SizedBox(
//                                 height: 10,
//                               ),
//                               new Text(
//                                 (detailsAPI != null)
//                                     ? detailsAPI.plots.toString()
//                                     : "Tidak Ada Data Deskripsi",
//                                 style: new TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 15,
//                                   fontFamily: "SF",
//                                   // fontWeight: FontWeight.w700,
//                                 ),
//                                 maxLines: 3,
//                                 overflow: TextOverflow.ellipsis,
//                                 textAlign: TextAlign.justify,
//                               ),
//                               new SizedBox(
//                                 height: 5,
//                               ),
//                               new InkWell(
//                                 onTap: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(builder: (context) {
//                                       titleAPI = titleController.text;
//                                       connectAPI
//                                           .getData(titleAPI)
//                                           .then((value) {
//                                         detailsAPI = value;
//                                         // setState(() {});
//                                       });
//                                       return DetailsMovie(
//                                           detailsAPI: detailsAPI);
//                                     }),
//                                   );
//                                 },
//                                 child: new Text(
//                                   "See Details >>>",
//                                   style: new TextStyle(
//                                     color: Colors.blue[700],
//                                   ),
//                                   // textAlign: TextAlign.right,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
