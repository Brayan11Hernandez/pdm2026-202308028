
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi pedido',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.brown,
        ),
        useMaterial3: true,
      ),
      home: const MiPedidoPage(),
    );
  }
}

class MiPedidoPage extends StatefulWidget {
  const MiPedidoPage({super.key});

  @override
  State<MiPedidoPage> createState() => _MiPedidoPageState();
}

class _MiPedidoPageState extends State<MiPedidoPage> {
  int cantidadCafe = 0;
  int cantidadSandwich = 0;
  int cantidadJugo = 0;

  double get total {
    return cantidadCafe * 10.00 +
        cantidadSandwich * 25.00 +
        cantidadJugo * 12.00;
  }

  void cambiarCantidad(String producto, int cambio) {
    setState(() {
      switch (producto) {
        case 'cafe':
          cantidadCafe = (cantidadCafe + cambio).clamp(0, 999);
          break;
        case 'sandwich':
          cantidadSandwich = (cantidadSandwich + cambio).clamp(0, 999);
          break;
        case 'jugo':
          cantidadJugo = (cantidadJugo + cambio).clamp(0, 999);
          break;
      }
    });
  }

  void vaciarPedido() {
    setState(() {
      cantidadCafe = 0;
      cantidadSandwich = 0;
      cantidadJugo = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5F1),
      appBar: AppBar(
        title: const Text('Mi pedido'),
        centerTitle: true,
        backgroundColor: const Color(0xFF6D4C41),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Mi cafetería',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4E342E),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Selecciona tus productos favoritos',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 28),

              ProductoPedido(
                nombre: 'Café',
                precio: 10.00,
                cantidad: cantidadCafe,
                icono: Icons.local_cafe,
                onSumar: () => cambiarCantidad('cafe', 1),
                onRestar: () => cambiarCantidad('cafe', -1),
              ),

              ProductoPedido(
                nombre: 'Sándwich',
                precio: 25.00,
                cantidad: cantidadSandwich,
                icono: Icons.lunch_dining,
                onSumar: () => cambiarCantidad('sandwich', 1),
                onRestar: () => cambiarCantidad('sandwich', -1),
              ),

              ProductoPedido(
                nombre: 'Jugo',
                precio: 12.00,
                cantidad: cantidadJugo,
                icono: Icons.local_drink,
                onSumar: () => cambiarCantidad('jugo', 1),
                onRestar: () => cambiarCantidad('jugo', -1),
              ),

              const Spacer(),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.06),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total del pedido',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Q${total.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6D4C41),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              SizedBox(
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: vaciarPedido,
                  icon: const Icon(Icons.delete_outline),
                  label: const Text(
                    'Vaciar pedido',
                    style: TextStyle(fontSize: 17),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6D4C41),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductoPedido extends StatelessWidget {
  final String nombre;
  final double precio;
  final int cantidad;
  final IconData icono;
  final VoidCallback onSumar;
  final VoidCallback onRestar;

  const ProductoPedido({
    super.key,
    required this.nombre,
    required this.precio,
    required this.cantidad,
    required this.icono,
    required this.onSumar,
    required this.onRestar,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 14),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF3E5DB),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icono,
                size: 28,
                color: const Color(0xFF6D4C41),
              ),
            ),
            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nombre,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Q${precio.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xFF795548),
                    ),
                  ),
                ],
              ),
            ),

            IconButton(
              onPressed: cantidad > 0 ? onRestar : null,
              icon: const Icon(Icons.remove_circle_outline),
              color: const Color(0xFF6D4C41),
            ),

            Text(
              '$cantidad',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            IconButton(
              onPressed: onSumar,
              icon: const Icon(Icons.add_circle_outline),
              color: const Color(0xFF6D4C41),
            ),
          ],
        ),
      ),
    );
  }
}
