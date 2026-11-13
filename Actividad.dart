void main() {
  //Parte 1

  //Punto 1 "Hola Mundo".
  print('Bienvenidos a Dart');

  //Punto 2 Declara una variable String y otra int.
  String nombre = 'Andres Felipe Martinez';
  int edad = 19;
  print('Mi nombre es: $nombre y mi edad es: $edad');

  //Punto 3 var y final
  var ciudad = 'Cali';
  ciudad = 'Popayan'; //var si se puede cambiar

  final pais = 'Colombia';
  // pais = 'Ecuador'; //final no se puede cambiar

  print('$pais, $ciudad');

  //Parte 2

  //Punto 4 Numeros y Strings
  double altura = 1.75;
  String cita = '"El éxito es la suma de pequeños esfuerzos."';
  print('Altura: $altura y cita favorita: $cita');

  //Punto 5 Booleanos y Condicionales
  bool esMayorDeEdad = edad >= 18;

  if (esMayorDeEdad) {
    print('Eres mayor de edad');
  } else {
    print('Eres menor de edad');
  }

  //Punto 6 Listas
  List<String> amigos = ['Carlos', 'Daniel', 'Laura'];

  for (String amigo in amigos) {
    print('Amigo: $amigo');
  }

  //Punto 7 Sets
  Set<String> ciudades = {'Cali', 'Bogota', 'Pasto'};

  ciudades.add('Medellin');
  ciudades.add('Cali');
  ciudades.remove('Pasto');

  print('Ciudades: $ciudades');

  //Punto 8 Mapas
  Map<String, String> capitales = {
    'Colombia': 'Bogota',
    'Peru': 'Lima',
    'Chile': 'Santiago'
  };

  print(capitales['Peru']);

  //Parte 3

  //Punto 9 Operadores Aritmeticos
  int a = 25;
  int b = 5;

  int suma = a + b;
  int resta = a - b;
  int multiplicacion = a * b;
  double division = a / b;

  print('Suma: $suma');
  print('Resta: $resta');
  print('Multiplicacion: $multiplicacion');
  print('Division: $division');

  //Punto 10 Operadores de Comparacion
  int x = 60;
  int y = 30;

  bool iguales = x == y;
  bool mayor = x > y;
  bool diferentes = x != y;

  print('$x == $y: -> $iguales');
  print('$x > $y: -> $mayor');
  print('$x != $y: -> $diferentes');

  //Parte 4

  //Punto 11 Funciones
  int resultado = sumar(20, 15);
  print('20 + 15 = $resultado');

  //Punto 12 Records
  var libro = (
    titulo: 'El Principito',
    autor: 'Antoine de Saint-Exupery',
    anio: 1943,
  );

  print('Libro: ${libro.titulo}, Autor: ${libro.autor}, Año: ${libro.anio}');

  //Parte 5

  //Punto 13 Analisis de una palabra
  String palabra = 'Programacion';

  print('Longitud: ${palabra.length}');
  print('Primera letra: ${palabra[0]}');
  print('Ultimas 3 letras: ${palabra.substring(palabra.length - 3)}');

  String resultadoPalabra =
      palabra.length > 5 ? palabra.toUpperCase() : palabra;

  print(resultadoPalabra);

  //Punto 14 Lista de notas academicas
  List<double> notas = [3.5, 4.0, 4.5, 3.8, 4.2];

  print(notas);

  double promedio = notas.reduce((a, b) => a + b) / notas.length;

  print('Promedio: ${promedio.toStringAsFixed(1)}');

  if (promedio >= 3.0) {
    print('El aprendiz ha aprobado');
  } else {
    print('El aprendiz ha reprobado');
  }

  //Punto 15 Lista Dinamica de Informacion Mixta
  List<dynamic> datos = ['Andres', 19, false, [15, 25, 35]];

  for (var elemento in datos) {
    print(elemento);
  }

  //Punto 16 Informacion personal con Map
  Map<String, dynamic> personal = {
    'Identificacion': 1029384756,
    'Nombre': 'Camila',
    'Edad': 20,
    'Estatura': 1.70
  };

  print('Edad: ${personal['Edad']}');
  print('Estatura: ${personal['Estatura']}');

  //Punto 17 Funcion que recibe una lista y retorna un Map
  List<int> numeros = [15, 8, 42, 67, 23, 10];

  Map<String, int> resultados = analizarLista(numeros);

  print(resultados);

  //Punto 18 Clase CuentaBancaria
  CuentaBancaria cuenta = CuentaBancaria(350000);

  print('Saldo Inicial: \$${cuenta.consultarSaldo()}');

  cuenta.depositar(50000);
  cuenta.depositar(30000);
  cuenta.retirar(40000);
  cuenta.retirar(-200);

  print('Saldo final: \$${cuenta.consultarSaldo()}');
}

//Punto 11
int sumar(int num1, int num2) {
  return num1 + num2;
}

//Punto 17
Map<String, int> analizarLista(List<int> numeros) {
  int mayor = numeros[0];
  int menor = numeros[0];

  for (int n in numeros) {
    if (n > mayor) mayor = n;
    if (n < menor) menor = n;
  }

  return {
    'cantidad': numeros.length,
    'mayor': mayor,
    'menor': menor,
  };
}

//Punto 18
class CuentaBancaria {
  double _saldo;

  CuentaBancaria(this._saldo);

  void depositar(double monto) {
    if (monto <= 0) {
      print('Monto invalido para depositar');
      return;
    }

    _saldo += monto;

    print('Deposito de \$$monto realizado');
  }

  void retirar(double monto) {
    if (monto <= 0) {
      print('Monto invalido para retirar');
      return;
    }

    if (monto > _saldo) {
      print('Fondos insuficientes');
      return;
    }

    _saldo -= monto;

    print('Retiro de \$$monto realizado');
  }

  double consultarSaldo() {
    return _saldo;
  }
}

// PUNTO 21
// Extension sobre el tipo int

extension IntUtilidades on int {

  // Getter para saber si el numero es par
  bool get esPar => this % 2 == 0;

  // Metodo para duplicar el valor
  int duplicar() {
    return this * 2;
  }
}


// PUNTO 22
// Extension sobre el tipo String

extension StringExtras on String {

  // Metodo para capitalizar la primera letra
  String capitalizar() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  // Getter para saber si el texto es un numero
  bool get esNumerico => double.tryParse(this) != null;
}


// PUNTO 23
// Funcion asincronica que devuelve un String

Future<String> obtenerDatosUsuario() async {
  print('Conectando con el servidor...');

  // Simulamos una espera de 2 segundos
  await Future.delayed(Duration(seconds: 2));

  // Retornamos el resultado
  return 'Carlos Perez (Nivel 5)';
}