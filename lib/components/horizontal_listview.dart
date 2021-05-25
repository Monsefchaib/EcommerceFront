import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  return Container(
    height: 110,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Category(
          image_url: 'https://image.flaticon.com/icons/png/512/4305/4305443.png',
          image_desc: 'Vêtements mâles',
        ),
        Category(
          image_url: 'https://image.flaticon.com/icons/png/512/3515/3515028.png',
          image_desc: 'Vêtements femelle',
        ),
        Category(
          image_url: 'https://image.flaticon.com/icons/png/512/186/186239.png',
          image_desc: 'Téléphone portable & Gadgets ',
        ),
        Category(
          image_url: 'https://image.flaticon.com/icons/png/512/1940/1940922.png',
          image_desc: 'Beauté et Santé',
        ),
        Category(
          image_url: 'https://image.flaticon.com/icons/png/512/3003/3003984.png',
          image_desc: 'Appareils ménagers',
        ),
        Category(
          image_url: 'https://image.flaticon.com/icons/png/512/744/744465.png',
          image_desc: 'Autos et Motos',
        ),
      ],
    ),
  );
  }
}

  class Category extends StatelessWidget{
    String image_url;
    String image_desc;
    Category({
      this.image_url,
      this.image_desc,
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(padding: EdgeInsets.all(2),
    child: InkWell(
      onTap: (){print('cat clicked');},
      child: Container(
      width: 100,
      child: ListTile(
        title: CircleAvatar(
          radius: 25.0,
          child: Image.network(image_url,fit: BoxFit.fill),
        ),
        subtitle: Text(image_desc, textAlign: TextAlign.center),
      ),
      ),
    ),
    );
  }

  }

