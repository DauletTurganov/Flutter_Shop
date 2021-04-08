import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:internet_magazin/ui/screens/helpers/provider.dart';
import 'package:internet_magazin/ui/screens/showInfo.dart';

class RecepiesList extends StatelessWidget {
  const RecepiesList({
    Key key,
    @required this.size,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(
        builder: (context, recept, child) {
          return Expanded(
              child: Container(
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: recept.recept.hits.length,
                    itemBuilder: (context, index) {
                      var items = recept.recept.hits;
                      if (recept.recipies != null) {
                        return Padding(
                          padding: EdgeInsets.all(30),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xffF4EBC2),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(items[index].recipe.label,
                                    style: TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Image.network(items[index].recipe.image),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Text('Ingredient Lines',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24
                                    ),),
                                  Container(
                                    constraints: BoxConstraints(
                                      maxHeight: size * 0.4,
                                      minHeight: size * 0.3,
                                    ),
                                    child: ListView.builder(
                                        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: items[index].recipe.ingredientLines.length,
                                        itemBuilder: (context, item) {
                                          return Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  items[index].recipe.ingredientLines[item],
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ]
                                          );
                                        }),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (context) => ShowInfo());
                                      },
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
                                      ),
                                      child: Container(
                                          padding: EdgeInsets.all(10),
                                          width: size * 0.6,
                                          alignment: Alignment.center,
                                          child: Text('Show Info',
                                            style: TextStyle(
                                              fontSize: 18.0,
                                            ),)
                                      )),
                                ],
                              ),
                            ),
                          ),
                        );
                      } else {
                        print('null');
                      }
                      return CircularProgressIndicator();
                    }
                ),
              ));
        }
    );
  }
}