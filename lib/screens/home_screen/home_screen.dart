import 'package:flutter/material.dart';
import 'package:my_cart/model/list_model.dart';
import 'package:my_cart/screens/cart_screen.dart';
import 'package:my_cart/utilities/common_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ListModel> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My cart App'),
        actions: [
          cartItems.isEmpty
              ? const Icon(Icons.shopping_cart)
              : Row(
                  children: [
                     Text(
                       "${cartItems.length}",
                     style:  const TextStyle(color: Colors.purple,
                         fontWeight: FontWeight.bold ),),
                    IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      onPressed: () async{
                        cartItems = await Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => CartScreen(
                            cartItems: cartItems,
                          ),
                        ));
                        setState(() {

                        });
                      },
                    ),
                  ],
                ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: ComList.names.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade200,
                border: Border.all(width: 2,
                  color: cartItems.contains(ComList.names[index])
                      ? Colors.purple
                      : Colors.transparent,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(30)),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          ComList.names[index].name,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: cartItems.contains(ComList.names[index])
                              ? FontWeight.bold : FontWeight.normal),
                        ),
                        Text(
                          "₹ ${ComList.names[index].price}",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: cartItems.contains(ComList.names[index])
                              ? FontWeight.bold : FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      cartItems.contains(ComList.names[index])
                          ? cartItems.remove(ComList.names[index])
                          : cartItems.add(ComList.names[index]);
                      setState(() {});
                    },
                    child: cartItems.contains(ComList.names[index])
                        ? const Text('Remove from cart')
                        : const Text('Add to cart'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
