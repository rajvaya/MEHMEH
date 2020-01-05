import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.amber,
      ),
      home: MehMehHome(),
    );
  }
}
 class MehMehHome extends StatefulWidget {
   @override
   _MehMehHomeState createState() => _MehMehHomeState();
 }

 class _MehMehHomeState extends State<MehMehHome> {
  var dio = new Dio();
  String  url = "https://media.giphy.com/media/3oEjI6SIIHBdRxXI40/giphy.gif";
  String  postlink = " ";
  String  subreddit = " ";
  String  title = " ";

  getMEME() async{
    
    var meme = await dio.get("https://meme-api.herokuapp.com/gimme");
    print(meme.data);
     setState(() {
       url = meme.data["url"];
       postlink = meme.data["postlink"];
       title = meme.data["title"];
       subreddit = meme.data["subreddit"];

     });
    
    
  }
  
  @override
  void initState() {
    // TODO: implement initState
    getMEME();
    super.initState();
  }
  
  
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(title: Text("GET RANDOM MEMES"),
       centerTitle: true,),
      body: Center(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Flexible(
               flex: 7,
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Image.network(url,fit: BoxFit.scaleDown,),
               ),
             ),
             Flexible(
                 flex:2,child: Text(title)),
             Flexible(
               flex: 2,
               child: Padding(
                 padding: const EdgeInsets.all(20.0),
                 child: FloatingActionButton.extended(
                   icon: Icon(Icons.file_download),
                   onPressed: (){
                     getMEME();
                   },
                   elevation: 0,
                   label: Text("GET MEME"),
                 ),
               ),
             ),
           ],
         ),
      ),
     );
   }
 }

