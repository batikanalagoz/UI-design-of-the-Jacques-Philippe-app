import 'package:flutter/material.dart';
import 'package:watch/data/entity/watch.dart';
import 'package:watch/ui/views/product.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

Future<List<Watch>> uploadWatch() async{
  var watchList = <Watch>[];
  var w1 = Watch(watch_id: 1, watch_name: "Jacques Philippe", watch_img: "watch1.jpg", watch_price: "18.800 ₺", watch_explanation: "JPQGC044311 Men's wristwatch");
  var w2 = Watch(watch_id: 2, watch_name: "Jacques Philippe", watch_img: "watch2.jpg", watch_price: "13.030 ₺", watch_explanation: "JPQGC044311 Men's wristwatch");
  var w3 = Watch(watch_id: 3, watch_name: "Jacques Philippe", watch_img: "watch3.jpg", watch_price: "13.030 ₺", watch_explanation: "JPQGC044311 Men's wristwatch");
  var w4 = Watch(watch_id: 4, watch_name: "Jacques Philippe", watch_img: "watch4.jpg", watch_price: "13.600 ₺", watch_explanation: "JPQGC044311 Men's wristwatch");
  var w5 = Watch(watch_id: 5, watch_name: "Jacques Philippe", watch_img: "watch5.jpg", watch_price: "12.020 ₺", watch_explanation: "JPQGC044311 Men's wristwatch");
  var w6 = Watch(watch_id: 6, watch_name: "Jacques Philippe", watch_img: "watch6.jpg", watch_price: "13.600 ₺", watch_explanation: "JPQGC044311 Men's wristwatch");
  var w7 = Watch(watch_id: 7, watch_name: "Jacques Philippe", watch_img: "watch7.jpg", watch_price: "11.470 ₺", watch_explanation: "JPQGC044311 Men's wristwatch");
  var w8 = Watch(watch_id: 8, watch_name: "Jacques Philippe", watch_img: "watch8.jpg", watch_price: "14.340 ₺", watch_explanation: "JPQGC044311 Men's wristwatch");
  watchList.add(w1);
  watchList.add(w2);
  watchList.add(w3);
  watchList.add(w4);
  watchList.add(w5);
  watchList.add(w6);
  watchList.add(w7);
  watchList.add(w8);
  return watchList;
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      title: const Text("JACQUES PHILIPPE",style: TextStyle(fontFamily: "playfair",fontSize: 21,),),
      leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_bag_outlined)),
      ],
    ),
    backgroundColor: Colors.grey[100],
    body: SingleChildScrollView(
      child: Column(
        children: [
          Center(child: SizedBox(height: 90, child: Image.asset("images/logo.png"))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("images/banner.jpg"),
          ),
          FutureBuilder(
            future: uploadWatch(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var watchList = snapshot.data as List<Watch>;
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: watchList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1 / 1.2,),
                  itemBuilder: (context, index) {
                    var clock = watchList[index];
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Product(watchi: clock,)));
                      },
                      child: Card(
                        color: const Color(0xFFFFFFFF),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Image.asset("images/${clock.watch_img}", fit: BoxFit.cover,),),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(clock.watch_name, style: const TextStyle(fontWeight: FontWeight.bold,),),
                                    Text(clock.watch_explanation,style: const TextStyle(color: Colors.black38),),
                                    Text(clock.watch_price, style: const TextStyle(fontWeight: FontWeight.bold,),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                    child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    ),
  );
}
}