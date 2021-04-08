import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:internet_magazin/ui/screens/helpers/provider.dart';



class SearchBar extends StatelessWidget {

  final String searchText;
  String searchItem;
  SearchBar({
    Key key,this.searchText,this.searchItem,
    @required this.size,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(top: 60.0, bottom: 5.0, left: 15.0, right: 15.0),
      height: MediaQuery.of(context).size.height * 0.25,
      width: size,
      color: Color(0xff63117F),
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //     colors: [Color(0xffCB11AB), Color(0xff481173)],
      //   ),
      // ),
      child: Padding(
        padding: EdgeInsets.only(bottom: 15.0, left: 20.0, right: 20.0, top: 20.0),
        child: Stack(

            children: [
              Positioned(
                  top: 35.0,
                  right: -5,
                  child: IconButton(
                    padding: EdgeInsets.only(right: 0),
                    onPressed: null,
                    icon: Icon(
                      Icons.photo_camera_outlined,
                      color: Colors.white,
                      size: 30,),
                  )),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      searchText,
                      style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      onChanged: (value) {
                        searchItem = value;
                        Provider.of<SearchProvider>(context, listen: false).addItem(searchItem);
                      },
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                      ),
                      decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                          prefixIcon: Icon(Icons.search,
                          size: 30,
                          color: Colors.grey,),
                          prefixStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          prefixIconConstraints: BoxConstraints(
                            minHeight: 15,
                            minWidth: 15,
                          ),
                          hintText: ' Search',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                          ),
                          filled: true,
                          fillColor: Color(0xffA941A9),
                          border:
                          UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffA941A9)),
                              borderRadius: BorderRadius.all(Radius.circular(10),
                              )
                          )
                      ),


                    ),

                  ]
              ),]
        ),
      ),
    );
  }
}
