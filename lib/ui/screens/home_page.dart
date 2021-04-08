import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///S:/AndroidPRojects/internet_magazin/lib/ui/screens/helpers/searchBar.dart';
import 'file:///S:/AndroidPRojects/internet_magazin/lib/ui/screens/helpers/navbar.dart';
import 'package:provider/provider.dart';
import 'package:internet_magazin/ui/screens/helpers/provider.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'widgets/recepiesList.dart';

class HomePage extends StatelessWidget {
  static String id = 'home_page';
  String searchItem;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
          children: [
            SearchBar(size: size, searchText: 'WILDCHERRIES',),
            HomePageStateful(),
            NavBar()
          ],
        ),
      );
  }
}


class HomePageStateful extends StatefulWidget {

  @override
  _HomePageStatefulState createState() => _HomePageStatefulState();
}

class _HomePageStatefulState extends State<HomePageStateful> {

  Widget _aecepies;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    // var wid = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size.height;
    return Expanded(
      child: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // height: size * 0.5,
                child:  ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
                  ),
                  onPressed:() async{
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      Provider.of<SearchProvider>(context, listen: false).changeSearchItem();
                      await Provider.of<SearchProvider>(context, listen: false).getData(Provider.of<SearchProvider>(context, listen: false).searchItems);
                      setState(() {
                        _aecepies = RecepiesList(size: size);
                        showSpinner = false;
                      });
                    }
                    catch(e) {
                      throw (e);
                    }
                    // if (Provider.of<SearchProvider>(context).recipies == null) {
                    // }

                  },
                  // color: Colors.lightBlueAccent,
                  child: Text(
                    'Search Test',
                    style: TextStyle(
                        color: Colors.blue
                    ),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  ElevatedButton(
                      child: Icon(Icons.navigate_before),
                      onPressed: () async{
                        setState(() {
                          showSpinner = true;
                          _aecepies = null;
                        });
                        Provider.of<SearchProvider>(context,listen: false).previousPage();
                        await Provider.of<SearchProvider>(context, listen: false).getData(Provider.of<SearchProvider>(context, listen: false).searchItems);
                        setState(() {
                          _aecepies = RecepiesList(size: size);
                          showSpinner = false;
                        });


                      }
                  ),

                  ElevatedButton(
                  onPressed: () async{
                              setState(() {
                              showSpinner = true;
                              _aecepies = null;
                              });
                              Provider.of<SearchProvider>(context,listen: false).goToStart();
                              await Provider.of<SearchProvider>(context, listen: false).getData(Provider.of<SearchProvider>(context, listen: false).searchItems);
                              setState(() {
                              _aecepies = RecepiesList(size: size);
                              showSpinner = false;
                              });},
                      child: Text('Reset')
                  ),

                  // CupertinoPicker(
                  //     itemExtent: ,
                  //     onSelectedItemChanged: (selectedIndex) {
                  //       print(selectedIndex);
                  //     },
                  //     children: ),

                  //
                  //

                  ElevatedButton(
                    child: Icon(Icons.navigate_next),
                    onPressed:() async {
                      setState(() {
                        showSpinner = true;
                        _aecepies = null;
                      });
                      Provider.of<SearchProvider>(context,listen: false).nextPage();
                      await Provider.of<SearchProvider>(context, listen: false).getData(Provider.of<SearchProvider>(context, listen: false).searchItems);
                      setState(() {
                        _aecepies = RecepiesList(size: size);
                        showSpinner = false;
                      });

                    } ,),

                ],
              ),

               Divider(
                 color: Colors.grey,
                 thickness: 2.0,
               ),
               Container(
                 child: _aecepies == null ? _aecepies = Text('Search something!',style: TextStyle(color: Colors.purple,fontSize: 24.0, fontWeight: FontWeight.bold),) : _aecepies
               ),


  ]),
        ),
      ),
    );
  }
}







