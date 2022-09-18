import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koumishop/pages/menu/menu_controller.dart';
import 'package:shimmer/shimmer.dart';

import 'details.dart';

class Menu extends GetView<MenuController> {
  //String subcategory_id;
  List listeProduit;
  Menu(this.listeProduit, {Key? key}) : super(key: key) {
    print("Le menu type...");
    //Timer(const Duration(seconds: 2), () {
    //controller.getMenu(subcategory_id);
    //});
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          // gradient: LinearGradient(
          //   colors: [
          //     Color.fromRGBO(255, 137, 147, 1),
          //     Color(0xFFFFFFFF),
          //   ],
          //   begin: FractionalOffset(0.0, 0.0),
          //   end: FractionalOffset(1.0, 1.0),
          //   stops: [0.0, 1.0],
          //   tileMode: TileMode.clamp,
          // ),
          ), // Color.fromARGB(255, 255, 232, 235),
      child: GridView.count(
        controller: ScrollController(),
        padding: const EdgeInsets.symmetric(horizontal: 3),
        crossAxisCount: 2,
        mainAxisSpacing: 0.1,
        crossAxisSpacing: 0.1,
        childAspectRatio: 0.6,
        children: List.generate(listeProduit.length, (index) {
          print('truc:--------');
          Map produit = listeProduit[index];
          return InkWell(
            onTap: () {
              //PanierController
              //
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (c) {
                  //return Details();
                  return Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 50,
                                child: Container(),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 50,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              icon: Icon(
                                                Icons.arrow_back_ios,
                                                color: Colors.black,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Details(produit),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                },
              );
            },
            child: Card(
              elevation: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 8,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Stack(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Align(
                              alignment: Alignment.center,
                              child: Image.network("${produit['image']}"),
                            ),
                          ),
                          // Padding(
                          //   padding: EdgeInsets.all(2),
                          //   child: Align(
                          //     alignment: Alignment.topRight,
                          //     child: IconButton(
                          //       icon: const Icon(
                          //         Icons.favorite_outline,
                          //         size: 20,
                          //       ),
                          //       color: Colors.red,
                          //       onPressed: () {
                          //         //
                          //       },
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            "${produit['name']}",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            "${produit['variants'][0]['measurement']} ${produit['variants'][0]['measurement_unit_name']}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "${produit['price']} FC",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // InkWell(
                          //   onTap: () {},
                          //   child: Container(
                          //     height: 20,
                          //     width: 20,
                          //     alignment: Alignment.center,
                          //     decoration: BoxDecoration(
                          //       color: Colors.white,
                          //       borderRadius: BorderRadius.circular(
                          //         10,
                          //       ),
                          //       border: Border.all(
                          //         color: Colors.grey.shade300,
                          //       ),
                          //     ),
                          //     child: Icon(
                          //       Icons.remove,
                          //       size: 19,
                          //       color: Colors.red,
                          //     ),
                          //   ),
                          // ),

                          Text(
                            "En stock",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // InkWell(
                          //   onTap: () {},
                          //   child: Container(
                          //     height: 20,
                          //     width: 20,
                          //     alignment: Alignment.center,
                          //     decoration: BoxDecoration(
                          //       color: Colors.red.shade700,
                          //       borderRadius: BorderRadius.circular(
                          //         10,
                          //       ),
                          //     ),
                          //     child: Icon(
                          //       Icons.add,
                          //       size: 20,
                          //       color: Colors.white,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

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
/*
Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 7,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Container(
                              height: 20,
                              width: 120,
                              color: Colors.grey,
                            ),
                            Container(
                              height: 15,
                              width: 50,
                              color: Colors.grey,
                            ),
                            Container(
                              height: 17,
                              width: 100,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        alignment: Alignment.center,
                      ),
                    ),
                  ],
                ),
              )
*/