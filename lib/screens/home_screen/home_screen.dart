import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My cart App'),actions: [
        Icon(CupertinoIcons.cart_badge_minus), SizedBox(width: 20,)
      ],),
      body: GridView.builder(
        itemCount: names.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.blueGrey.shade200,
                border: Border.all(
                  color: Colors.lightGreen,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              children: [
                Center(
                    child: Expanded(
                        child: Text(
                  names[index],
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ))),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Add to cart'),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
