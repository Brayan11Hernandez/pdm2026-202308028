import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const kFondo = Color(0xFFF7F7F7);
const kSuperficie = Color(0xFFFFFFFF);
const kGris = Color(0xFFF1F1F1);
const kTexto = Color(0xFF202020);
const kMuted = Color(0xFF8A8A8A);
const kVerde = Color(0xFFB8F34B);
const kNegro = Color(0xFF1D1D1D);
const kBorde = Color(0xFFE5E5E5);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Add Money',
      theme: ThemeData(
        scaffoldBackgroundColor: kFondo,
        colorScheme: ColorScheme.fromSeed(
          seedColor: kVerde,
        ),
        useMaterial3: true,
      ),
      home: const AddMoneyPage(),
    );
  }
}

class AddMoneyPage extends StatelessWidget {
  const AddMoneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kFondo,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: kSuperficie,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: kBorde),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: kTexto,
                    size: 18,
                  ),
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      'Add money',
                      style: TextStyle(
                        fontSize: 18,
                        color: kTexto,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 42),
              ],
            ),

            const SizedBox(height: 30),

            const Text(
              'Select card',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w600,
                color: kTexto,
              ),
            ),

            const SizedBox(height: 16),

            SizedBox(
              height: 145,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  bankCard(
                    kVerde,
                    kTexto,
                    'Banrural.',
                    'Debit card',
                    '•••• 4929',
                    true,
                  ),
                  const SizedBox(width: 12),
                  bankCard(
                    kNegro,
                    Colors.white,
                    'VISA',
                    'Credit card',
                    '•••• 7895',
                    false,
                  ),
                  const SizedBox(width: 12),
                  bankCard(
                    const Color(0xFF555555),
                    Colors.white,
                    'BAC.',
                    'Bank card',
                    '•••• 1101',
                    false,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            const Text(
              'Add money to Neobank',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: kTexto,
              ),
            ),

            const SizedBox(height: 16),

            moneyOption(
              Icons.savings_outlined,
              'Move your direct deposit',
            ),

            moneyOption(
              Icons.swap_horiz,
              'Transfer from other banks',
            ),

            moneyOption(
              Icons.apple,
              'Apple Pay',
            ),

            moneyOption(
              Icons.credit_card_outlined,
              'Debit / Credit Card',
            ),
          ],
        ),
      ),
    );
  }
}

Widget bankCard(
  Color fondo,
  Color texto,
  String title,
  String subtitle,
  String number,
  bool selected,
) {
  return Container(
    width: 145,
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: fondo,
      borderRadius: BorderRadius.circular(20),
      border: selected
          ? Border.all(
              color: kNegro,
              width: 3,
            )
          : null,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 17,
              height: 17,
              decoration: BoxDecoration(
                color: selected ? kNegro : Colors.white,
                shape: BoxShape.circle,
              ),
              child: selected
                  ? const Icon(
                      Icons.circle,
                      size: 8,
                      color: kVerde,
                    )
                  : null,
            ),
            const Spacer(),
            Text(
              title,
              style: TextStyle(
                color: texto,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),

        const Spacer(),

        Text(
          subtitle,
          style: TextStyle(
            color: texto.withValues(alpha: 0.65),
            fontSize: 12,
          ),
        ),

        const SizedBox(height: 5),

        Text(
          number,
          style: TextStyle(
            color: texto,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}

Widget moneyOption(
  IconData icon,
  String title,
) {
  return Container(
    height: 62,
    margin: const EdgeInsets.only(bottom: 12),
    decoration: BoxDecoration(
      color: kGris,
      borderRadius: BorderRadius.circular(14),
    ),
    child: ListTile(
      leading: Icon(
        icon,
        color: kTexto,
        size: 22,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: kTexto,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 15,
        color: kMuted,
      ),
    ),
  );
}