import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Model/Pets.dart';

class PetMarket extends StatefulWidget {
  static const String RouteName = "Pet";

  @override
  State<PetMarket> createState() => _PetMarketState();
}

class _PetMarketState extends State<PetMarket> {
  var cont = TextEditingController();
  String search = "";

  @override
  Widget build(BuildContext context) {
    List<Pets> Filter = [];
    petList.forEach((element) {
      if (element.type == search) {
        Filter.add(element);
      }
    });

    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: const Color(0xffDFE0DF),
        toolbarHeight: 86,
        title: const Text(
          "Per Market",
          style: TextStyle(
              fontFamily: "BalsamiqSans",
              fontSize: 30,
              fontWeight: FontWeight.w400,
              color: Colors.black87),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
                color: const Color(0xffDFE0DF),
                borderRadius: BorderRadius.circular(20)),
            child: TextFormField(
              onFieldSubmitted: (value) {
                setState(() {
                  search = value;
                });
              },
              controller: cont,
              decoration: InputDecoration(
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  hintText: "Search by pet type",
                  hintStyle: const TextStyle(
                      fontFamily: "BalsamiqSans",
                      fontWeight: FontWeight.w400,
                      fontSize: 22,
                      color: Color(0xffACACAC)),
                  prefixIcon:
                      Icon(Icons.search, color: Colors.yellowAccent.shade400)),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              width: 369,
              color: const Color(0XFFDFE0DF),
              child: ListView.builder(
                itemCount: search == null || search == ""
                    ? petList.length
                    : Filter.length,
                itemBuilder: (context, index) {
                  var pe = petList[index];

                  return Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: search == null || search == ""
                          ? defaultWidget(
                              pathImage: pe.pathImage,
                              cate: pe.Category,
                              type: pe.type,
                              love: pe.LoveCount.toString())
                          : defaultWidget(
                              pathImage: Filter[index].pathImage,
                              cate: Filter[index].Category,
                              type: Filter[index].type,
                              love: Filter[index].LoveCount.toString()));

                  /*Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(petList[index].pathImage))
                    ),
                  );*/
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

List<Pets> petList = [
  Pets(
      type: "Dog",
      Category: "Golden",
      LoveCount: 20,
      pathImage: "assets/images/im/dog1.jpg"),
  Pets(
      type: "Lablador",
      Category: "Golden",
      LoveCount: 18,
      pathImage: "assets/images/im/dog2.jpg"),
  Pets(
      type: "Dog",
      Category: "Cardigan",
      LoveCount: 12,
      pathImage: "assets/images/im/dog3.jpg"),
  Pets(
      type: "Cat",
      Category: "Street Cat",
      LoveCount: 17,
      pathImage: "assets/images/im/cat1.jpg"),
  Pets(
      type: "Cat",
      Category: "White Cat",
      LoveCount: 19,
      pathImage: "assets/images/im/cat2.jpg"),
  Pets(
      type: "Cat",
      Category: "Kitten",
      LoveCount: 18,
      pathImage: "assets/images/im/cat3.jpg"),
  Pets(
      type: "Bird",
      Category: "House Bird",
      LoveCount: 15,
      pathImage: "assets/images/im/bird1.jpg"),
  Pets(
      type: "Bird",
      Category: "Parrot",
      LoveCount: 14,
      pathImage: "assets/images/im/bird2.jpg"),
  Pets(
      type: "Bird",
      Category: "Pink Bird",
      LoveCount: 15,
      pathImage: "assets/images/im/bird3.jpg"),
  Pets(
      type: "Bird",
      Category: "Talking Parrot",
      LoveCount: 17,
      pathImage: "assets/images/im/bird3.jpg"),
  Pets(
      type: "Rat",
      Category: "Hamster",
      LoveCount: 9,
      pathImage: "assets/images/im/hamster1.jpg"),
  Pets(
      type: "Rabbit",
      Category: "Brown Rabbit",
      LoveCount: 16,
      pathImage: "assets/images/im/rabbit1.jpg"),
  Pets(
      type: "Rabbit",
      Category: "Gray Rabbit",
      LoveCount: 17,
      pathImage: "assets/images/im/rabbit2.jpg"),
];

class defaultWidget extends StatelessWidget {
  String cate;
  String type;
  String love;
  String pathImage;

  defaultWidget(
      {required this.cate,
      required this.type,
      required this.love,
      required this.pathImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 357,
      height: 126,
      child: Row(
        children: [
          Container(
            width: 115,
            height: 112,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                pathImage,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                cate,
                style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 22,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                type,
                style: const TextStyle(
                    color: Color(0xffACACAC),
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Image.asset("assets/images/pawprintImg.png"),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Pet Love:",
                    style: TextStyle(
                        color: Color(0xffDB6400),
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    love,
                    style: const TextStyle(
                        color: Color(0xffDB6400),
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
