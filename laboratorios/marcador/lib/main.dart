import 'package:flutter/material.dart';

void main() {
  runApp(const MarcadorApp());
}

class MarcadorApp extends StatelessWidget {
  const MarcadorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marcador Deportivo',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
      ),
      home: const MarcadorPage(),
    );
  }
}

class MarcadorPage extends StatefulWidget {
  const MarcadorPage({super.key});

  @override
  State<MarcadorPage> createState() => _MarcadorPageState();
}

class _MarcadorPageState extends State<MarcadorPage> {
  int puntosA = 0;
  int puntosB = 0;

  void sumarA() {
    setState(() {
      puntosA++;
    });
  }

  void restarA() {
    setState(() {
      if (puntosA > 0) {
        puntosA--;
      }
    });
  }

  void sumarB() {
    setState(() {
      puntosB++;
    });
  }

  void restarB() {
    setState(() {
      if (puntosB > 0) {
        puntosB--;
      }
    });
  }

  void reiniciar() {
    setState(() {
      puntosA = 0;
      puntosB = 0;
    });
  }

  String obtenerMensaje() {
    if (puntosA > puntosB) {
      return 'Va ganando Equipo A';
    } else if (puntosB > puntosA) {
      return 'Va ganando Equipo B';
    } else {
      return 'Empate';
    }
  }

  @override
  Widget build(BuildContext context) {
    bool ganaA = puntosA > puntosB;
    bool ganaB = puntosB > puntosA;

    return Scaffold(
      backgroundColor: const Color(0xFF101828),

      appBar: AppBar(
        backgroundColor: const Color(0xFF172033),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'MARCADOR DEPORTIVO',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.sports_soccer,
              color: Colors.white70,
              size: 42,
            ),

            const SizedBox(height: 8),

            const Text(
              'PARTIDO ACTUAL',
              style: TextStyle(
                color: Colors.white60,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),

            const SizedBox(height: 30),

            Row(
              children: [
                Expanded(
                  child: tarjetaEquipo(
                    nombre: 'EQUIPO A',
                    puntos: puntosA,
                    ganando: ganaA,
                    colorEquipo: const Color(0xFF2563EB),
                    sumar: sumarA,
                    restar: restarA,
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'VS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Expanded(
                  child: tarjetaEquipo(
                    nombre: 'EQUIPO B',
                    puntos: puntosB,
                    ganando: ganaB,
                    colorEquipo: const Color(0xFFF97316),
                    sumar: sumarB,
                    restar: restarB,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 35),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 14,
              ),
              decoration: BoxDecoration(
                color: (ganaA || ganaB)
                    ? const Color(0xFF16A34A)
                    : const Color(0xFF344054),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                obtenerMensaje(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: reiniciar,
              icon: const Icon(Icons.refresh),
              label: const Text('REINICIAR PARTIDO'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF101828),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 18,
                ),
                textStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tarjetaEquipo({
    required String nombre,
    required int puntos,
    required bool ganando,
    required Color colorEquipo,
    required VoidCallback sumar,
    required VoidCallback restar,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: ganando
            ? const Color(0xFFDCFCE7)
            : Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: ganando
              ? const Color(0xFF22C55E)
              : Colors.transparent,
          width: 4,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),

      child: Column(
        children: [
          Container(
            width: 55,
            height: 7,
            decoration: BoxDecoration(
              color: ganando
                  ? const Color(0xFF22C55E)
                  : colorEquipo,
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          const SizedBox(height: 20),

          Text(
            nombre,
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: ganando
                  ? const Color(0xFF15803D)
                  : const Color(0xFF101828),
            ),
          ),

          const SizedBox(height: 15),

          Text(
            '$puntos',
            style: TextStyle(
              fontSize: 70,
              height: 1,
              fontWeight: FontWeight.bold,
              color: ganando
                  ? const Color(0xFF16A34A)
                  : colorEquipo,
            ),
          ),

          const SizedBox(height: 25),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: restar,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF2F4F7),
                  foregroundColor: const Color(0xFF344054),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(18),
                ),
                child: const Text(
                  '-1',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(width: 15),

              ElevatedButton(
                onPressed: sumar,
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorEquipo,
                  foregroundColor: Colors.white,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(18),
                ),
                child: const Text(
                  '+1',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}