import 'package:flutter/material.dart';
import '../models/quote.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;

  const QuoteCard({
    Key? key,
    required this.quote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32.0),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(24.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.format_quote_rounded,
            size: 48,
            color: AppColors.accent.withOpacity(0.2),
          ),
          const SizedBox(height: 16),
          Text(
            '"${quote.text}"',
            style: AppTextStyles.quoteText,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Container(
            height: 2,
            width: 40,
            color: AppColors.accent,
          ),
          const SizedBox(height: 24),
          Text(
            "- ${quote.author}",
            style: AppTextStyles.authorText,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
