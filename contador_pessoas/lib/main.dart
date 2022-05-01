import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int contar = 0;

  void decrementando() {
    setState(() {
      contar--;
    });
    print(contar);
  }

  void incrementando() {
    setState(() {
      contar++;
    });
    print(contar);
  }

  bool get vazio => contar == 0;
  bool get lotou => contar == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://cdn.pixabay.com/photo/2014/08/05/10/32/ice-cream-410330_960_720.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              lotou ? 'Lotou!' : 'Pode entrar!!!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 30),
            Text(
              contar.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 100,
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: vazio ? null : decrementando,
                  style: TextButton.styleFrom(
                    backgroundColor:
                        vazio ? Colors.white.withOpacity(0.2) : Colors.white,
                    fixedSize: Size(100, 100),
                    primary: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'SAIU',
                    style: TextStyle(
                      color:
                          vazio ? Colors.black.withOpacity(0.2) : Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 45),
                TextButton(
                  onPressed: lotou ? null : incrementando,
                  style: TextButton.styleFrom(
                    backgroundColor:
                        lotou ? Colors.white.withOpacity(0.2) : Colors.white,
                    fixedSize: Size(100, 100),
                    primary: Colors.greenAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'ENTROU',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
