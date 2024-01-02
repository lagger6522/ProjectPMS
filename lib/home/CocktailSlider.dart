
import 'package:flutter/material.dart';
import 'package:lab45/CocktailScreen.dart';
import 'package:lab45/home/CocktailsType.dart';
import '../cocktail.dart';

class CocktailSlider extends StatelessWidget {
  final List<Cocktail> cocktails = [
    Cocktail(name: 'Blackberry', imagePath: 'images/blackberry.png', price: 4.99),
    Cocktail(name: 'Mohito', imagePath: 'images/mohito.png', price: 2.99),
  ];
  final int countOfCocktail;
  final Function(int) onCocktailCountChanged;

  CocktailSlider({
    required this.countOfCocktail,
    required this.onCocktailCountChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        itemCount: cocktails.length,
        itemBuilder: (context, index) {
          final cocktail = cocktails[index];
          final price = cocktail.price;
          return InkWell(
            onTap: () async {
              int result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CocktailScreen(
                    initialCountOfCocktail: countOfCocktail,
                    cocktail: cocktail,
                    price: price,
                  ),
                ),
              );
              onCocktailCountChanged(result);
            },
            child: Container(
              width: double.infinity,
              height: 500,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    top: 0.0,
                    left: 0.0,
                    child: Image.asset(
                      cocktail.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 38.0,
                    left: 30.0,
                    child: Stack(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color.fromARGB(255, 31, 31, 31),
                          ),
                        ),
                        Positioned(
                          top: 10.0,
                          left: 12.0,
                          child: Text(
                            '30%',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 35.0,
                          left: 7.0,
                          child: const Text(
                            'discount',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 16.0,
                    left: 22.0,
                    child: Text(
                      cocktail.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 37,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}