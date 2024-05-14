import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_cart/screens/cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> names = [
    'Apple',
    'Banana',
    'Orange',
    'Grapes',
    'Strawberry',
    'Watermelon',
    'Pineapple',
    'Mango',
    'Kiwi',
    'Peach',
    'Stripes',
    'Polka Dots',
    'Floral',
    'Geometric',
    'Abstract',
    'Animal Print',
    'Tie-Dye',
    'Ombre',
    'Plaid',
    'Checkered',
    'Milk',
    'Eggs',
    'Bread',
    'Butter',
    'Cheese',
    'Yogurt',
    'Cereal',
    'Rice',
    'Pasta',
    'Flour',
  ];

  List<String> cartItems = [];

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
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => CartScreen(
                            cartItems: cartItems,
                          ),
                        ));
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
          itemCount: names.length,
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
                  color: cartItems.contains(names[index])
                      ? Colors.purple :Colors.lightGreen,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        names[index],
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.displayMedium
                            ?.copyWith(fontWeight: cartItems.contains(names[index])
                            ? FontWeight.bold : FontWeight.normal),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      cartItems.contains(names[index])
                          ? cartItems.remove(names[index])
                          : cartItems.contains(names[index]);
                      setState(() {});
                    },
                    child: cartItems.contains(names[index])
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
