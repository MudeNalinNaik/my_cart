import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_cart/model/list_model.dart';

class CartScreen extends StatefulWidget {
  final List<ListModel> cartItems;

  const CartScreen({Key? key, required this.cartItems}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double totalPrice = 0.0;

  @override
  void initState() {
    totalPriceFun();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, widget.cartItems);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int a = 0; a < widget.cartItems.length; a++) ...[
                        ListTile(
                          title: Text(widget.cartItems[a].name,
                              style: Theme.of(context).textTheme.titleLarge),
                          subtitle: Text("₹ ${widget.cartItems[a].price}",
                              style: Theme.of(context).textTheme.titleMedium),
                          trailing: SizedBox(
                            width: 120,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    if (widget.cartItems[a].quantity > 1) {
                                      widget.cartItems[a].quantity--;
                                    } else {
                                      widget.cartItems
                                          .remove(widget.cartItems[a]);
                                    }
                                    totalPriceFun();
                                    setState(() {});
                                  },
                                ),
                                Text('${widget.cartItems[a].quantity}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    widget.cartItems[a].quantity++;
                                    totalPriceFun();
                                    setState(() {});
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(
                          height: 0.5,
                          color: Colors.purple,
                        )
                      ]
                    ],
                  ),
                ),
              ),
              SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                      child: Text('Total : $totalPrice',
                          style: Theme.of(context).textTheme.titleLarge))),
            ],
          ),
        ),
      ),
    );
  }

  totalPriceFun() {
    totalPrice = 0.0;
    for (int a = 0; a < widget.cartItems.length; a++) {
      totalPrice = totalPrice +
          (widget.cartItems[a].quantity * widget.cartItems[a].price);
    }
    setState(() {});
  }
}
