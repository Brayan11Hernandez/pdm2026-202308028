import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const kFondo = Color(0xFF0B1014);
const kSuperficie = Color(0xFF151B20);
const kBorde = Color(0xFF293138);

const kTexto = Color(0xFFF4F4F2);
const kMuted = Color(0xFF9AA3A9);

const kDorado = Color(0xFFF2AE3D);
const kVerde = Color(0xFF4FD17B);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sonar+',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: kFondo,
        colorScheme: ColorScheme.fromSeed(
          seedColor: kDorado,
          brightness: Brightness.dark,
        ),
      ),
      home: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(18),
          children: [
            const SizedBox(height: 12),
            Row(
              children: const [
                Text(
                  'Sonar',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '+',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: kDorado,
                  ),
                ),
                Spacer(),
                Icon(Icons.notifications_none),
              ],
            ),
            const SizedBox(height: 28),
            Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hola, Croczy',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Que suene increíble tu día. ',
                        style: TextStyle(
                          fontSize: 13,
                          color: kMuted,
                        ),
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 27,
                  backgroundColor: kSuperficie,
                  child: const Icon(
                    Icons.person,
                    color: kDorado,
                    size: 34,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Mi equipo',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Ver todo',
                    style: TextStyle(
                      color: kDorado,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 165,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  equipoCard(
                    Icons.electric_bolt,
                    'Fender',
                    'Stratocaster',
                  ),
                  equipoCard(
                    Icons.speaker,
                    'Marshall',
                    'DSL40CR',
                  ),
                  equipoCard(
                    Icons.tune,
                    'MXR',
                    'Phase 90',
                  ),
                  equipoCard(
                    Icons.settings_input_component,
                    'Boss',
                    'TU-3',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),
            Row(
              children: [
                featureCard(
                  Icons.compare_arrows,
                  'Comparar equipos',
                  'Compara y elige la mejor opción',
                ),
                const SizedBox(width: 12),
                featureCard(
                  Icons.build,
                  'Mantenimiento',
                  'Agenda y recuerda tus revisiones',
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                featureCard(
                  Icons.verified_user_outlined,
                  'Técnicos confiables',
                  'Encuentra expertos cerca de ti',
                ),
                const SizedBox(width: 12),
                featureCard(
                  Icons.shopping_cart_outlined,
                  'Repuestos',
                  'Productos y accesorios',
                ),
              ],
            ),
            const SizedBox(height: 18),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF3C2B13),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: kDorado,
                ),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.warning_amber,
                    color: kDorado,
                    size: 30,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cambio de cuerdas en 3 días',
                          style: TextStyle(
                            color: kDorado,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Evita daños en el mástil y mantén tu sonido al máximo.',
                          style: TextStyle(
                            fontSize: 11,
                            color: kTexto,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Recomendaciones confiables',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  recomendacionCard(
                    'Victory V40',
                    '4.6',
                  ),
                  recomendacionCard(
                    'Strymon Timeline',
                    '4.7',
                  ),
                  recomendacionCard(
                    'Yamaha HS5',
                    '4.5',
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          selectedItemColor: kDorado,
          unselectedItemColor: kMuted,
          backgroundColor: kSuperficie,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.compare_arrows),
              label: 'Comparar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.build_outlined),
              label: 'Mantenimiento',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.groups_outlined),
              label: 'Técnicos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Perfil',
            ),
          ],
        ),
      ),
    );
  }
}

Widget equipoCard(
  IconData icon,
  String marca,
  String modelo,
) {
  return Container(
    width: 125,
    margin: const EdgeInsets.only(right: 10),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: kSuperficie,
      borderRadius: BorderRadius.circular(13),
      border: Border.all(
        color: kBorde,
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Center(
            child: Icon(
              icon,
              color: kDorado,
              size: 50,
            ),
          ),
        ),
        Text(
          marca,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          modelo,
          style: const TextStyle(
            fontSize: 12,
            color: kMuted,
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          '● En buen estado',
          style: TextStyle(
            fontSize: 10,
            color: kVerde,
          ),
        ),
      ],
    ),
  );
}

Widget featureCard(
  IconData icon,
  String titulo,
  String subtitulo,
) {
  return Expanded(
    child: Container(
      height: 135,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: kSuperficie,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: kBorde,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: kDorado,
            size: 30,
          ),
          const Spacer(),
          Text(
            titulo,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitulo,
            style: const TextStyle(
              fontSize: 11,
              color: kMuted,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget recomendacionCard(
  String titulo,
  String rating,
) {
  return Container(
    width: 140,
    margin: const EdgeInsets.only(right: 10),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: kSuperficie,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: kBorde,
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: Center(
            child: Icon(
              Icons.speaker,
              size: 50,
              color: kMuted,
            ),
          ),
        ),
        Text(
          titulo,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '★ $rating',
          style: const TextStyle(
            color: kDorado,
          ),
        ),
        const Text(
          'Opiniones verificadas',
          style: TextStyle(
            fontSize: 9,
            color: kMuted,
          ),
        ),
      ],
    ),
  );
}