// class ItemsNaProdazhu extends StatefulWidget {
//   @override
//   _ItemsNaProdazhuState createState() => _ItemsNaProdazhuState();
// }
//
// class _ItemsNaProdazhuState extends State<ItemsNaProdazhu> {
//   @override
//   Widget build(BuildContext context) {
//     return
//       Expanded(
//         child: ListView(
//           physics: BouncingScrollPhysics(),
//           shrinkWrap: true,
//           scrollDirection: Axis.vertical,
//           children: [
//             // AddvertCard1('Henmlo', Colors.green),
//             // AddvertCard1('Henmlo', Colors.red),
//             // AddvertCard1('Henmlo', Colors.blue),
//             // AddvertCard1('Henmlo', Colors.green),
//             // AddvertCard1('Henmlo', Colors.red),
//             // AddvertCard1('Henmlo', Colors.blue),
//             // AddvertCard1('Henmlo', Colors.green),
//             // AddvertCard1('Henmlo', Colors.red),
//             // AddvertCard1('Henmlo', Colors.blue),
//           ],
//         ),
//       );
//   }
// }
// class AddvertCard extends StatelessWidget {
//
//   var sometext;
//   Color colour;
//   var recept;
//   var img;
//
//
//   AddvertCard({@required this.sometext,this.colour, @required this.img, @required this.recept});
//
//   @override
//   Widget build(BuildContext context) {
//     var wid = MediaQuery.of(context).size.width;
//     var size = MediaQuery.of(context).size.height;
//     return  Container(
//         height: size * 0.2,
//         color: colour,
//         margin: EdgeInsets.all(20),
//         width: wid *  0.6,
//         child: Column(
//           children: [
//             Text(
//               sometext,
//             ),
//             Image.network(img),
//             Text(recept)
//           ],
//         )
//     );
//   }
// }
//
// class AddvertCard1 extends StatelessWidget {
//
//   final String sometext;
//   final Color colour;
//   // final Image img;
//
//
//   AddvertCard1(this.sometext, this.colour,);
//
//   @override
//   Widget build(BuildContext context) {
//     var wid = MediaQuery.of(context).size.width;
//     var size = MediaQuery.of(context).size.height;
//     return  Container(
//       height: size * 0.2,
//       color: colour,
//       margin: EdgeInsets.all(20),
//       width: wid *  0.4,
//       child: Text(
//         sometext,
//       ),
//     );
//   }
// }

// Expanded(
//   child: Container(
//     child: FutureBuilder(
//       future: null,
//       builder: (context, AsyncSnapshot snapshot) {
//         if (snapshot.hasData) {
//           print('snapshot has data');
//           return Consumer<SearchProvider>(
//             builder: (context, receipt, child){
//               return ListView.builder(
//                   itemBuilder: (context, index) {
//                     return Column(
//                       children: [
//                         Text(receipt.recipies[index].label),
//                         Image.network(receipt.recipies[index].image),
//                       ],
//                     );
//                   });
//             }
//
//           );
//         } else if (snapshot.hasError) {
//           print(snapshot.error);
//         }
//         return CircularProgressIndicator();
//       },
//     )
//   ),
// ),


// FutureBuilder(
//    future: Provider.of<SearchProvider>(context).getData(searchItem),
//     builder: (context, snapshot) {
//      if(snapshot.hasData) {
//        print('snapshotHasDATA ${snapshot.data}');
//      }else if (snapshot.hasError) {
//        print(snapshot.error);
//          }
//    return CircularProgressIndicator();
//    })


// FutureBuilder(
//   future: getRecipiesNOW(),
//   builder: (context,  AsyncSnapshot<List<Recipe>> snapshot) {
//   print('waiting');
//   if (snapshot.hasData) {
//   print('snapshot has data');
//   } else if (snapshot.hasError) {
//   print('Error');
//   }
//   return CircularProgressIndicator();
//   }),




// FutureBuilder(
//     future:  getRecipiesNOW(),
//     builder: (context,  AsyncSnapshot<List<Recipe>> snapshot) {
//       if(snapshot.hasData) {
//         print(snapshot.data);
//         print(snapshot.data.length);
//         print('snapshto has data');
//         return Expanded(
//           child: Container(
//                 child:  ListView.builder(
//                           itemCount: snapshot.data.length,
//                           shrinkWrap: true,
//                           itemBuilder: (context, index) {
//                             return Container(
//                                 height: size,
//                                 child: Column(
//                                     children: [
//                                       Text(
//                                         recipeList[index].label,
//                                         style: TextStyle(
//                                           fontSize: 22,
//                                           fontWeight: FontWeight
//                                               .bold,
//                                         ),
//                                       ),
//                                       Text(
//                                         recipeList[index].source,
//                                         style: TextStyle(
//                                           fontSize: 22,
//                                           fontWeight: FontWeight
//                                               .bold,
//                                         ),
//                                       ),
//                                 Image.network(recipeList[index].image),
// Column(
//                     children: [
//                       Text('YOU NEED',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 25
//                        ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.all(30.0),
//                         child: Container(
//                           constraints: BoxConstraints(
//                             maxHeight: 300,
//                             maxWidth: MediaQuery.of(context).size.width,
//                             minHeight: 300,
//                           ),
//                           width: MediaQuery.of(context).size.width,
//                           child: ListView.builder(
//                             physics: NeverScrollableScrollPhysics(),
//                               scrollDirection: Axis.vertical,
//                               shrinkWrap: true,
//                               itemCount: recipeList[index].ingredientLines.length,
//                               itemBuilder: (context, items) {
//                                 return Text(recipeList[index].ingredientLines[items].toString());
//                               }
//                           ),
//                         ),
//                       )
//                     ],
// )
// ]
//       )
//   );
// })));
// return Image.network(recipeList[0].image);
// return Expanded(
//   child: Container(
//     child: ListView.builder(
//         itemCount: snapshot.data.length,
//         shrinkWrap: true,
//         itemBuilder: (context, index) {
//           return Container(
//             height: size,
//             child: Column(
//               children: [
//                 Text(
//                   snapshot.data[index]['recipe']['label'].toString(),
//                   style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Image.network(snapshot.data[index]['recipe']['image']),
//                 Column(
//                   children: [
//                     Text('YOU NEED',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 25
//                      ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(30.0),
//                       child: Container(
//                         constraints: BoxConstraints(
//                           maxHeight: 300,
//                           maxWidth: MediaQuery.of(context).size.width,
//                           minHeight: 300,
//                         ),
//                         width: MediaQuery.of(context).size.width,
//                         child: ListView.builder(
//                           physics: NeverScrollableScrollPhysics(),
//                             scrollDirection: Axis.vertical,
//                             shrinkWrap: true,
//                             itemCount: snapshot.data[index]['recipe']['ingredientLines'].length,
//                             itemBuilder: (context, items) {
//                               return Text(snapshot.data[index]['recipe']['ingredientLines'][items].toString());
//                             }
//                         ),
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           );
//     }),
//   ),
// );

// Column(
//
//   children: [ListView.builder(
//     padding: EdgeInsets.all(20.0),
//     physics: BouncingScrollPhysics(),
//     scrollDirection: Axis.vertical,
//     shrinkWrap: true,
//     itemCount: snapshot.data.length,
//     itemBuilder: (context, index) {
// return AddvertCard(
//   sometext: snapshot.data[index]['recipe']['label'].toString(),
//   img: snapshot.data[index]['recipe']['image'],
//   recept: snapshot.data[index]['recipe']['ingredientLines'].toString(),
// );
// return
// Column(
//     children: [
//       Padding(
//         padding: EdgeInsets.symmetric(vertical: 15.0),
//           child: Text(snapshot.data[index]['recipe']['label'].toString(),
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 24,
//           ),)),
//      Image.network(snapshot.data[index]['recipe']['image'],
//      height: 400.0,
//      width: 400.0,),
//       Text('Need Ingredients',
//         style: TextStyle(
//           fontWeight: FontWeight.bold,
//           fontSize: 24,
//         ),
//       ),
//       ListView.builder(
//           shrinkWrap: true,
//           itemCount: snapshot.data[index]['recipe']['ingredientLines'].length,
//           itemBuilder: (context, items) {
//   return Text(snapshot.data[index]['recipe']['ingredientLines'][items].toString());
//
//   }
//
//       )],

//   );
// },
//  // Column(
//  children: snapshot.data.map((entry) {
//    var w = Text(entry.toString());
//    return w;
//  }).toList()),
// ),]
// );
//
//       } else if (snapshot.hasError) {
//         Text('Snapshot has error');
//       }
//       return CircularProgressIndicator();
//     }
// ),
// SingleChildScrollView(
//   scrollDirection: Axis.vertical,
//     child: Container(
//       child: Column(
//         children: [
//
//
//
//
//
//           ],
//       ),
//     ),
// ),