import 'package:flutter/material.dart';
import 'package:lab45/CounterWidget.dart';
import '../cocktail.dart';

class CocktailScreen extends StatefulWidget {
  final int initialCountOfCocktail;
  final Cocktail cocktail;
  final double price;

  CocktailScreen({Key? key, required this.initialCountOfCocktail, required this.cocktail,  required this.price})
      : super(key: key);

  @override
  _CocktailScreenState createState() => _CocktailScreenState();
}

class _CocktailScreenState extends State<CocktailScreen> {
  late int countOfCocktail;
  late Cocktail cocktail; // Используем объект Cocktail

  @override
  void initState() {
    super.initState();
    countOfCocktail = widget.initialCountOfCocktail;
    cocktail = widget.cocktail; // Инициализируем cocktail
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: Container(
                width: double.infinity,
                height: 450,
                child: Stack(
                  children: [
                    Positioned(
                      child: Image.asset(
                        cocktail.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pop(context, countOfCocktail);
                        },
                        icon: const Icon(Icons.chevron_left),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color.fromARGB(255, 62, 55, 73),
                        ),
                        label: const Text('Back to main'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 200),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        children: [
                          Text(
                            'Blackberry',
                            style: TextStyle(
                              fontSize: 34,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      CounterWidget(
                        initialValue: countOfCocktail,
                        onCounterChanged: (count) {
                          setState(() {
                            countOfCocktail = count;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildTipContainer('10%'),
                      _buildTipContainer('25%'),
                      _buildTipContainer('50%'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildPercentageContainer(),
                      _buildPercentageContainer(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildTotalOrderColumn(),
                      _buildTotalPriceColumn(),
                      _buildOrderButton(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTipContainer(String percentage) {
    return InkWell(
      onTap: () {
        // Handle tip container tap
      },
      child: Container(
        width: 85,
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(97, 207, 207, 207),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromARGB(255, 38, 29, 54),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              top: 5,
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  percentage,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(197, 207, 207, 207),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              bottom: 5,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: const Text(
                  'tips',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(197, 207, 207, 207),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

Widget _buildPercentageContainer() {
  double totalPrice = widget.cocktail.price * widget.initialCountOfCocktail;

  return InkWell(
    onTap: () {
      // Обработка нажатия на контейнер с процентами
    },
    child: Container(
      width: 150,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromARGB(255, 38, 29, 54),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            top: 5,
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                '${widget.cocktail.price}', // Отображение цены коктейля
                style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(197, 207, 207, 207),
                ),
              ),
            ),
          ),
          Positioned.fill(
            bottom: 5,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                '${totalPrice}', // Отображение итоговой цены
                style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(197, 207, 207, 207),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


  Widget _buildTotalOrderColumn() {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              'Total Order',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        Row(
          children: [
            InkWell(
              onTap: () {
                // Handle total order tap
              },
              child: const Icon(
                Icons.abc,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTotalPriceColumn() {
    return Column(
      children: [
        const Text(
          'Total Price',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildOrderButton() {
    return Column(
      children: [
        InkWell(
          onTap: () {
            // Handle order button tap
          },
          child: Container(
            width: 85,
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color.fromARGB(255, 62, 55, 73),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 12,
                  child: const Icon(Icons.abc),
                ),
                Positioned(
                  top: 55,
                  child: const Icon(Icons.abc),
                ),
                Positioned(
                  bottom: 12,
                  child: const Icon(Icons.abc),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
