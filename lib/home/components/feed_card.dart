import 'package:flutter/material.dart';

class FeedCard extends StatelessWidget {
  const FeedCard(this.title, this.image, this.onTap);

  final String title;
  final String image;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(image,width: MediaQuery.of(context).size.width, height: 150,),
        ),
        subtitle: Column(
          children: [
            Text(title, textAlign: TextAlign.center, style: TextStyle( fontWeight: FontWeight.bold),),
            FlatButton(child: Text('Read more'), onPressed: ,)
          ],
        ),
        onTap: () => onTap()),
    );
  }
}
