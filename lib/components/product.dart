import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Products> {
  var product_list = [
    {
      "title":"Samsung NU8500 Curved",
      "imageurl":"https://cutt.ly/Xb5vSOk",
      "description":"Fast af Boy",
      "old_price":"270K",
      "new_price":"1100",
    },
    {
      "title":"Airpods Series 2 Wireless",
      "imageurl":"https://cutt.ly/tb5vIyO",
      "description":"Naadyin kaysm3ou mzyan",
      "old_price":"15K",
      "new_price":"120",
    },
    {
      "title":"Iphone 11 Pro Max",
      "imageurl":"https://cutt.ly/ib5vnBy",
      "description":"Naaadi",
      "old_price":"15K",
      "new_price":"820",
    },
    {
      "title":"MSI GT725 8RG-002CN",
      "imageurl":"https://cutt.ly/kb5vEu4",
      "description":"Pc khfif",
      "old_price":"15K",
      "new_price":"1200",
    }
  ];
  @override
  Widget build(BuildContext context) {
    print(product_list.length);
    return GridView.builder(

        itemCount: product_list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index){
          print(product_list[index]['title']);
          return SingleProd(
          product_title: product_list[index]['title'],
          product_url: product_list[index]['imageurl'],
          product_desc: product_list[index]['description'],
          product_oldprice: product_list[index]['old_price'],
          product_newprice: product_list[index]['new_price'],
          );
    });
  }
}

class SingleProd extends StatelessWidget {
  String product_title;
  String product_url;
  String product_desc;
  String product_oldprice;
  String product_newprice;
  SingleProd({
    this.product_title,
    this.product_url,
    this.product_desc,
    this.product_oldprice,
    this.product_newprice,
});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(tag: product_title, child: Material(
     child: InkWell(
       onTap: (){},
       child: GridTile(
           footer: Container(

             color: Colors.white,
           child: ListTile(
             leading: Padding(
               padding: const EdgeInsets.all(1.0),
               child: Column(
                 children: <Widget>[
                   Text(product_title,style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.left),
                   Text(product_desc, textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.w300)),
                   Text("\$$product_newprice",style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.left),
                 ],
               ),
             ),

       ),),
       child: Image.network(product_url, fit: BoxFit.cover,),
     ),
     ),   
      ))
    );
  }
}
