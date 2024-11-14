import 'package:flutter/material.dart';
import 'package:watch/data/entity/watch.dart';

class Product extends StatefulWidget {
  Watch watchi;
  Product({required this.watchi});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text("JACQUES PHILIPPE",style: TextStyle(fontFamily: "playfair",fontSize: 21,),),
      leading: IconButton(onPressed: () {
        Navigator.pop(context);
      }, icon: const Icon(Icons.arrow_back_ios_new)),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_bag_outlined)),
      ],
    ),
    body: Center(
        child: Column(
          children: [
            Image.asset("images/${widget.watchi.watch_img}"),
            Padding(padding: const EdgeInsets.only(top: 20),
              child: Text("${widget.watchi.watch_name}",style: const TextStyle(fontSize: 20),),),
            Padding(padding: const EdgeInsets.only(top: 10),
              child: Text("${widget.watchi.watch_explanation}"),
            ),
            Padding(padding: const EdgeInsets.only(top: 10),
              child: Text("${widget.watchi.watch_price}",style: const TextStyle(fontSize: 20),),
            ),
            Padding(padding: const EdgeInsets.only(top: 15),
              child: SizedBox(width: 250,
                child: TextButton(onPressed: (){}, child: const Text("ADD TO CART",style: TextStyle(color: Colors.white),),
                  style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      )
                    ),
                ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
