import 'dart:convert';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../profil_controller.dart';

class Commande extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Commande();
  }
}

class _Commande extends State<Commande> {
  /*
  var headers = {
  'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2NDAyNTM3ODYsImlzcyI6ImVLYXJ0IiwiZXhwIjoxNjQwMjU1NTg2LCJzdWIiOiJlS2FydCBBdXRoZW50aWNhdGlvbiJ9.cBhkpRrvjJDK15wBtHtENZJGWG1YdvX09Z9zysbAnyA'
};
var request = http.MultipartRequest('POST', Uri.parse('koumishopapi/webadmin/api-firebase/order-process.php'));
request.fields.addAll({
  'accesskey': '90336',
  'get_orders': '1',
  'user_id': '5'
});

request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {
  print(await response.stream.bytesToString());
}
else {
  print(response.reasonPhrase);
}

  */
  //
  ProfilController profilController = Get.find();
  //
  Future<Widget> getFaq() async {
    //
    var headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2NjI2NjgwMTEsImlzcyI6ImVLYXJ0IiwiZXhwIjo2LjQ4MDAwMDAwMDAwMDAwMmUrMjQsInN1YiI6ImVLYXJ0IEF1dGhlbnRpY2F0aW9uIn0.B3j6ZUzOa-7XfPvjJ3wvu3eosEw9CN5cWy1yOrv2Ppg'
    };
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://webadmin.koumishop.com/api-firebase/user-addresses.php'));
    request.fields.addAll(
      {
        'accesskey': '90336',
        'user_id': profilController.infos['user_id'],
        'get_addresses': '1',
      },
    );

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      Map mapFaqs = jsonDecode(await response.stream.bytesToString());
      print(mapFaqs);
      if (mapFaqs["error"]) {
        return Container();
      } else {
        adresses = mapFaqs["data"];
        return ListView(
          padding: const EdgeInsets.all(20),
          children: List.generate(adresses.length, (index) {
            Map adresse = adresses[index];
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: ListTile(
                    title: Text("${adresse["landmark"]}"),
                    subtitle:
                        Text("${adresse["address"]} / ${adresse["city"]}"),
                    trailing: IconButton(
                      onPressed: () {
                        //
                        setState(() {
                          adresses.removeAt(index);
                          box.write('adresses', adresses);
                          Get.snackbar("Adresse", "Suppression ??ffectu??");
                        });
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ),
                )
              ],
            );
          }),
        );
      }
    } else {
      print(response.reasonPhrase);
      return Container();
    }
  }

  //
  List adresses = [];
  //
  final box = GetStorage();
  //
  @override
  void initState() {
    //
    //adresses = box.read('adresses') ?? [];
    //
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red, // Status bar color
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 255, 232, 235),
          //appBar: AppBar(),
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(255, 137, 147, 1),
                  Color(0xFFFFFFFF),
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 1.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 55,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 10),
                          width: 150,
                          height: 40,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                                color: Colors.red,
                              ),
                              Text(
                                "Vos commande",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ListView(
                    children: [
                      Card(
                        elevation: 1,
                        child: SizedBox(
                          height: Get.size.height / 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  decoration: const BoxDecoration(
                                    //color: Colors.green,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "OTP: 452740",
                                        style: tx(),
                                      ),
                                      Text(
                                        "N?? 379",
                                        style: tx(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 1,
                                color: Colors.black,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Commande plac??e",
                                            textAlign: TextAlign.center,
                                            style: tx2(11),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          child: Text(
                                            "Commande en traitemant",
                                            textAlign: TextAlign.center,
                                            style: tx2(11),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          child: Text(
                                            "Commande en cours de livraison",
                                            textAlign: TextAlign.center,
                                            style: tx2(11),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          child: Text(
                                            "Commande livr??e",
                                            textAlign: TextAlign.center,
                                            style: tx2(11),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.shopping_cart),
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          height: 1,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Icon(Icons.shopping_bag),
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          height: 1,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Icon(Icons.delivery_dining_outlined),
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          height: 1,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Icon(Icons.headset),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "09-06-2022",
                                            textAlign: TextAlign.center,
                                            style: tx2(11),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          child: Text(
                                            "09-06-2022",
                                            textAlign: TextAlign.center,
                                            style: tx2(11),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          child: Text(
                                            "10-06-2022",
                                            textAlign: TextAlign.center,
                                            style: tx2(11),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          child: Text(
                                            "10-06-2022",
                                            textAlign: TextAlign.center,
                                            style: tx2(11),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 1,
                                color: Colors.black,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  decoration: const BoxDecoration(
                                    //color: Colors.green,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                          text: "FC 50000   ",
                                          children: [
                                            TextSpan(
                                              text: "50 \$",
                                              style: tx2(17),
                                            ),
                                          ],
                                        ),
                                        style: tx(),
                                      ),
                                      Text(
                                        "Afficher le details",
                                        style: tx2(17),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  //
  TextStyle tx() {
    return TextStyle(
      color: Colors.black,
      fontSize: 17,
      fontWeight: FontWeight.w900,
    );
  }

  //
  TextStyle tx2(double taille) {
    return TextStyle(
      color: Colors.black,
      fontSize: taille,
      fontWeight: FontWeight.w300,
    );
  }

  //
  Widget Shimm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Card(
          elevation: 1,
          color: Colors.grey,
          child: Container(
            height: 100,
            width: 100,
          ),
        ),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          child: Card(
            elevation: 1,
            child: Container(
              height: 10,
              width: 100,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          child: Card(
            elevation: 1,
            child: Container(
              height: 10,
              width: 100,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          child: Card(
            elevation: 1,
            child: Container(
              height: 10,
              width: 100,
            ),
          ),
        ),
      ],
    );
  }
}
