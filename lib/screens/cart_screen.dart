import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/components/color_icon.dart';
import 'package:online_shopping/controllers/cart_controller.dart';

import '../constants.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<CartController>(
              builder: (cartController) {
                var _cartList = cartController.getItems;

                return ListView.builder(
                  itemCount: _cartList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: KDefaultPadding / 2),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 6),
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: _cartList[index].color,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.asset(_cartList[index].image),
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: KDefaultPadding - 5),
                                child: Text(
                                  _cartList[index].title,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              //SizedBox(height: 10,),
                              Row(
                                children: [
                                  IconSign(
                                    icon1: Icons.remove,
                                    press: () {
                                      cartController.addGlassItem(_cartList[index].glassProduct!, -1);
                                      cartController.addShoesItem(_cartList[index].shoesProduct!, -1);
                                      cartController.addBagItem(_cartList[index].bagProduct!,-1);
                                      cartController.addDressItem(
                                          _cartList[index].dressProduct!, -1);


                                    },
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${_cartList[index].quantity}",
                                    //items.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  IconSign(
                                    icon1: Icons.add,
                                    press: () {
                                      cartController.addGlassItem(_cartList[index].glassProduct!, 1);
                                      cartController.addShoesItem(_cartList[index].shoesProduct!, 1);
                                      cartController.addBagItem(_cartList[index].bagProduct!, 1);
                                      cartController.addDressItem(_cartList[index].dressProduct!, 1);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: KDefaultPadding + 10),
                            child: Text(
                              "\$${_cartList[index].price * _cartList[index].quantity}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: KDefaultPadding + 10,
                                left: KDefaultPadding + 5),
                            child: IconButton(
                              onPressed: () {
                                cartController.removeItem(_cartList[index].id);
                              },
                              icon: Icon(
                                Icons.delete,
                                size: 25,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Row(
            children: [
              Text(
                "Total Price",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
              Text(
                "Total Price",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
            ],
          ),
          //SizedBox(height: 100,),
        ],
      ),
    );
  }
}
