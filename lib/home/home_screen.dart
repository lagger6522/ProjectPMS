import 'package:flutter/material.dart';
import 'package:lab45/CocktailScreen.dart';
import 'package:lab45/home/CocktailSlider.dart';
import 'package:lab45/home/CocktailsType.dart';
import 'package:lab45/home/UserOrdersContainer.dart';
import '../cocktail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int countOfCocktail = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tonight',
                            style: TextStyle(
                              fontSize: 34,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'better night with alcohol',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  
                  UserOrdersContainer(countOfCocktail: countOfCocktail, orders: [],),

                ],
              ),
              
              const SizedBox(height: 20),
              
              CocktailsType(
                countOfCocktail: countOfCocktail,
                onCocktailCountChanged: (result) {
                  setState(() {
                    countOfCocktail = result;
                  });
                  print(result);
                },
              ),
              
              const SizedBox(height: 20),

              CocktailSlider(
                countOfCocktail: countOfCocktail,
                onCocktailCountChanged: (result) {
                  setState(() {
                    countOfCocktail = result;
                  });
                  print(result);
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
