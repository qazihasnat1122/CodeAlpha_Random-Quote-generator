import 'dart:math';
import 'package:flutter/material.dart';

import '../data/quotes_data.dart';
import '../models/quote.dart';
import '../utils/app_colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/quote_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Quote _currentQuote;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _currentQuote = quotesData[_random.nextInt(quotesData.length)];
  }

  void _generateRandomQuote() {
    setState(() {
      int nextIndex;
      do {
        nextIndex = _random.nextInt(quotesData.length);
      } while (
        _currentQuote.id == quotesData[nextIndex].id && 
        quotesData.length > 1
      );
      
      _currentQuote = quotesData[nextIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Daily Inspiration',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 600),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0.0, 0.1),
                            end: Offset.zero,
                          ).animate(animation),
                          child: child,
                        ),
                      );
                    },
                    child: QuoteCard(
                      key: ValueKey<String>(_currentQuote.id),
                      quote: _currentQuote,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              CustomButton(
                text: 'New Quote',
                onPressed: _generateRandomQuote,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
