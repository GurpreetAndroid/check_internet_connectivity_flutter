import 'package:check_internet_app/utils/utilities.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class HomeScreen extends StatefulWidget {
   final String title;
   HomeScreen({super.key, required this.title});

   @override
   HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text("Network Check", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),),
      ),
      body:   Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Click on the below button to check the network is available or not.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),),
            SizedBox(
              height: 40,
            ),
            Container(
              width: 200,
              padding: EdgeInsets.only(bottom: 15.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize:   Size(250, 40),
                    backgroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                onPressed: () {
                  checkConnection();
                },
                child: Text('Check Connection',
                  style: TextStyle(color: Colors.white, fontSize: 16.0, fontStyle: FontStyle.italic),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  checkConnection() async {
    bool? isInternetAccess = await InternetConnection().hasInternetAccess;
    if (isInternetAccess) {
      Utilities().showNetworkStatusDialog(context, isInternetAccess);
    } else {
      debugPrint("Connection Status : $isInternetAccess");
      Utilities().showNetworkStatusDialog(context, isInternetAccess);
    }
  }
}
