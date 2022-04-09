import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title: "Contador",
    home : Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int count = 0;
  int contar = 0;

  void increment(){
    setState(() {
      count++;
      print(count);

    });
  }
  void decrement() {
    setState(() {
      count--;
    });
    print(count);
  }
void mais(){
    setState(() {
      contar++;
      print(count);
    });
}
void menos(){
    setState(() {
      contar--;
  print(contar);
    });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.green,
      appBar: AppBar(title: Text("placar",style: TextStyle(color: Colors.white, fontSize: 30))
      ),
      body : Center(
        child: Stack(
          children: [
            (Image.asset("assets/campo3.jpg", fit: BoxFit.cover,height: 1000,
            )
          ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                Text('Casa $count ',
                    style: TextStyle(color: Colors.green, fontSize: 50)
                ),

                Row (
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: <Widget>[
                    TextButton(
                      child: Text(
                          "+",
                          style:TextStyle(color: Colors.green,
                            fontSize: 30,
                          )
                      ),
                      onPressed: increment,
                    ),
                    TextButton(
                      child: Text("-",
                          style:TextStyle(color: Colors.green,
                            fontSize: 30,
                          )),
                      onPressed: decrement,
                    )
                  ],
                ),
                Row (
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
                Text("X",
                  style : TextStyle(
                    color: Colors.green,
                    fontSize: 50,
                  ),
                ),
                Text(
                  'Visitante $contar',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 50,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: mais,
                      style: TextButton.styleFrom(),
                      child: Text(
                        '+',
                        style: TextStyle(color: Colors.green, fontSize: 30),
                      ),
                    ),
                    TextButton(
                      onPressed: menos,
                      style: TextButton.styleFrom(),
                      child: Text(
                        '-',
                        style: TextStyle(color: Colors.green, fontSize: 30),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        )
    ),
    );
  }
}

