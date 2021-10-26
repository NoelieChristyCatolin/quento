import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView.builder( itemCount: 8,
      itemBuilder: (context, index) => Card(
        child: ListTile(
          title: Image.network('https://images.summitmedia-digital.com/cosmo/images/2021/08/05/angel-secillano-shy-girl-poses-1628157585.jpg',width: MediaQuery.of(context).size.width, height: 150,),
    subtitle: Text("10 ~Shy Girl~ Poses We're Copying From Angel Secillano"),
        onTap: ()=> _launchURL("https://www.cosmo.ph/beauty/angel-secillano-shy-girl-poses-a4462-20210805?ref=feed_1"),),
      ))
        
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  void _launchURL(url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch link';
}
