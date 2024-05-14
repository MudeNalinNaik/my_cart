import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final List<String> cartItems;

  const CartScreen({Key? key, required this.cartItems}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (int a = 0; a < widget.cartItems.length; a++) ...[
                  ListTile(
                    title: Text(widget.cartItems[a],
                        style: Theme.of(context).textTheme.displayMedium),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        widget.cartItems.remove(widget.cartItems[a]);
                        setState(() {

                        });
                      },
                    ),
                  ),
                  const Divider(
                    height: 0.5,
                    color: Colors.green,
                  )
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
