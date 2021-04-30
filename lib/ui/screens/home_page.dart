import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///S:/AndroidPRojects/internet_magazin/lib/ui/screens/helpers/searchBar.dart';
import 'file:///S:/AndroidPRojects/internet_magazin/lib/ui/screens/helpers/navbar.dart';
import 'package:provider/provider.dart';
import 'file:///S:/AndroidPRojects/internet_magazin/lib/providers/provider.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'widgets/recepiesList.dart';
import 'package:beauty_navigation/beauty_navigation.dart';
import 'widgets/navigator.dart';

class HomePage extends StatelessWidget {
  static String id = 'home_page';
  String searchItem;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff63117F),
      ),
      bottomNavigationBar: BeautyNavigator(),
      drawer: Drawer(
        child: ListView(
          children: [
             UserAccountsDrawerHeader(
                 accountName: Text('Daulet Turganov'),
                 accountEmail: Text('turganov_1998@mail.ru'))
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
          children: [
            SearchBar(searchText: 'Recipe Search App',),
            HomePageStateful(),
            // NavBar()
          ],
        ),
      // bottomNavigationBar: BottomNavigationBar(
      //
      // ),
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
  Widget _navigation;

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
                //TODO: Refactorit vse ento
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
                       // assert (Provider.of<SearchProvider>(context, listen: false).searchItems != null);
                      if (Provider.of<SearchProvider>(context, listen: false).searchItems != null) {

                        await Provider.of<SearchProvider>(context, listen: false).getData(Provider.of<SearchProvider>(context, listen: false).searchItems);
                        setState(() {
                          _aecepies = RecepiesList(size: size);
                          _navigation = Consumer<SearchProvider>(
                              builder: (context, provider, child) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [

                                    ElevatedButton(
                                        child: Icon(Icons.navigate_before),
                                        onPressed: () async{
                                          setState(() {
                                            showSpinner = true;
                                            _aecepies = Text('Previuos Page',style: TextStyle(color: Colors.purple,fontSize: 24.0, fontWeight: FontWeight.bold),);
                                          });
                                          provider.previousPage();
                                          await provider.getData(provider.searchItems);
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
                                            _aecepies = Text('Reset',style: TextStyle(color: Colors.purple,fontSize: 24.0, fontWeight: FontWeight.bold),);
                                          });
                                          provider.goToStart();
                                          await provider.getData(provider.searchItems);
                                          setState(() {
                                            _aecepies = RecepiesList(size: size);
                                            showSpinner = false;
                                          });
                                          },
                                        child: Text('Reset')
                                    ),
                                    ElevatedButton(
                                      child: Icon(Icons.navigate_next),
                                      onPressed:() async {
                                        setState(() {
                                          showSpinner = true;
                                          _aecepies = Text('Next Page',style: TextStyle(color: Colors.purple,fontSize: 24.0, fontWeight: FontWeight.bold),);
                                        });
                                        provider.nextPage();
                                        await provider.getData(provider.searchItems);
                                        // await provider.getData(provider.searchItems);
                                        setState(() {
                                          _aecepies = RecepiesList(size: size);
                                          showSpinner = false;
                                        });
                                      } ,),
                                  ],
                                );
                              }

                          );
                          showSpinner = false;
                        });
                      }

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
              //TODO : Заэкстрактить это
              Container(
                child: _navigation == null ? _navigation = Text('Search something!', style: TextStyle(color: Colors.purple,fontSize: 24.0, fontWeight: FontWeight.bold,)) : _navigation
              ),

               Divider(
                 color: Colors.grey,
                 thickness: 2.0,
               ),
               Container(
                 child: _aecepies == null ? _aecepies = Text('Try "chicken", "apple", etc.',style: TextStyle(color: Colors.purple,fontSize: 16.0, fontWeight: FontWeight.bold),) : _aecepies
               ),


  ]),
        ),
      ),
    );
  }
}







