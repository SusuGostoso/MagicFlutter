// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magic Flutter',
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> msgsTitle = [
    'Pense em qualquer carta abaixo',
    'Cartas embaralhadas',
    'Cartas novamente embaralhadas'
  ];
  List<String> msgsDescription = [
    'e escolha o monte que ela está!',
    'localize e escolha o monte que ela está',
    'por fim, em qual monte sua carta está?'
  ];

  static List<String> cards = [
    'images/QH.png',
    'images/JC.png',
    'images/10C.png',
    'images/QC.png',
    'images/KH.png',
    'images/KD.png',
    'images/6C.png',
    'images/QD.png',
    'images/7S.png',
    'images/QS.png',
    'images/7C.png',
    'images/8S.png',
    'images/7D.png',
    'images/10H.png',
    'images/AS.png',
    'images/2H.png',
    'images/JD.png',
    'images/9D.png',
    'images/10D.png',
    'images/5C.png',
    'images/4H.png',
    'images/3C.png',
    'images/9S.png',
    'images/7H.png',
    'images/JH.png',
    'images/5H.png',
    'images/8C.png',
    'images/3H.png',
    'images/3S.png',
    'images/AH.png',
    'images/3D.png',
    'images/8D.png',
    'images/KS.png',
    'images/2C.png',
    'images/4D.png',
    'images/5D.png',
    'images/JS.png',
    'images/10S.png',
    'images/AD.png',
    'images/AC.png',
    'images/9C.png',
    'images/2S.png',
    'images/5S.png',
    'images/6S.png',
    'images/6H.png',
    'images/9H.png',
    'images/8H.png',
    'images/6D.png',
    'images/4C.png',
    'images/KC.png',
    'images/2D.png',
    'images/4S.png'
  ];

  final List<String> cardsAux = [];

  @override
  void initState() {
    super.initState();
    iniciarMagica();
  }

  int etapa = 0;
  int varAux = 0;
  bool resultado = false;
  bool comecou = false;
  String cartaResultado = "";

  List<String> monte_1 = [];
  List<String> monte_2 = [];
  List<String> monte_3 = [];
  List<String> monte_4 = [];
  List<String> monte_5 = [];
  List<String> monte_6 = [];
  List<String> monte_7 = [];

  List<List<String>> montes = [];
  List<List<String>> montesMentirosos = [];
  List<List<String>> montesAuxiliares = [];

  List<String> monte_1_mentiroso = [];
  List<String> monte_2_mentiroso = [];
  List<String> monte_3_mentiroso = [];
  List<String> monte_4_mentiroso = [];
  List<String> monte_5_mentiroso = [];
  List<String> monte_6_mentiroso = [];
  List<String> monte_7_mentiroso = [];

  List<String> monteAux_1 = [];
  List<String> monteAux_2 = [];
  List<String> monteAux_3 = [];
  List<String> monteAux_4 = [];
  List<String> monteAux_5 = [];
  List<String> monteAux_6 = [];
  List<String> monteAux_7 = [];

  int total_cartas = 35;

  void iniciarMagica() {
    cards.shuffle();

    monte_1.clear();
    monte_2.clear();
    monte_3.clear();
    monte_4.clear();
    monte_5.clear();
    monte_6.clear();
    monte_7.clear();

    total_cartas = (totalMontes * 7).toInt();

    for (int i = 0; i < total_cartas; i++) {
      if (i >= 0 && i < 7) {
        monte_1.add(cards[i]);
      } else if (i >= 7 && i < 14) {
        monte_2.add(cards[i]);
      } else if (i >= 14 && i < 21) {
        monte_3.add(cards[i]);
      } else if (i >= 21 && i < 28) {
        monte_4.add(cards[i]);
      } else if (i >= 28) {
        monte_5.add(cards[i]);
      }
    }

    setState(() {
      etapa = 0;
      resultado = false;
      varAux = 0;
      comecou = false;
    });
  }

  void escolherMonte(int monteNumber) {
    cardsAux.clear();

    monteAux_1.clear();
    monteAux_2.clear();
    monteAux_3.clear();
    monteAux_4.clear();
    monteAux_5.clear();
    monteAux_6.clear();
    monteAux_7.clear();

    if (monteNumber == 1) {
      for (int i = 0; i < 7; i++) {
        monteAux_1.add(monte_3[i]);
      }

      for (int i = 0; i < 7; i++) {
        monteAux_2.add(monte_2[i]);
      }

      for (int i = 0; i < 7; i++) {
        monteAux_3.add(monte_1[i]);
      }

      for (int i = 0; i < 7; i++) {
        monteAux_4.add(monte_4[i]);
      }

      for (int i = 0; i < 7; i++) {
        monteAux_5.add(monte_5[i]);
      }
    } else if (monteNumber == 2) {
      for (int i = 0; i < 7; i++) {
        monteAux_1.add(monte_1[i]);
      }

      for (int i = 0; i < 7; i++) {
        monteAux_2.add(monte_3[i]);
      }

      for (int i = 0; i < 7; i++) {
        monteAux_3.add(monte_2[i]);
      }

      for (int i = 0; i < 7; i++) {
        monteAux_4.add(monte_4[i]);
      }

      for (int i = 0; i < 7; i++) {
        monteAux_5.add(monte_5[i]);
      }
    } else if (monteNumber == 3) {
      for (int i = 0; i < 7; i++) {
        monteAux_1.add(monte_1[i]);
      }

      for (int i = 0; i < 7; i++) {
        monteAux_2.add(monte_2[i]);
      }

      for (int i = 0; i < 7; i++) {
        monteAux_3.add(monte_3[i]);
      }

      for (int i = 0; i < 7; i++) {
        monteAux_4.add(monte_4[i]);
      }

      for (int i = 0; i < 7; i++) {
        monteAux_5.add(monte_5[i]);
      }
    } else if (monteNumber == 4) {
      for (int i = 0; i < 7; i++) {
        monteAux_1.add(monte_1[i]);
      }

      for (int i = 0; i < 7; i++) {
        monteAux_2.add(monte_2[i]);
      }

      for (int i = 0; i < 7; i++) {
        monteAux_3.add(monte_4[i]);
      }

      for (int i = 0; i < 7; i++) {
        monteAux_4.add(monte_3[i]);
      }

      for (int i = 0; i < 7; i++) {
        monteAux_5.add(monte_5[i]);
      }
    } else {
      for (int i = 0; i < 7; i++) {
        monteAux_1.add(monte_1[i]);
      }

      for (int i = 0; i < 7; i++) {
        monteAux_2.add(monte_2[i]);
      }

      for (int i = 0; i < 7; i++) {
        monteAux_3.add(monte_5[i]);
      }

      for (int i = 0; i < 7; i++) {
        monteAux_4.add(monte_4[i]);
      }

      for (int i = 0; i < 7; i++) {
        monteAux_5.add(monte_3[i]);
      }
    }

    //Primeiro monte
    for (int i = 0; i < 7; i++) {
      cardsAux.add(monteAux_1[i]);
    }

    //Segundo monte
    for (int i = 0; i < 7; i++) {
      cardsAux.add(monteAux_2[i]);
    }

    //Terceiro monte
    for (int i = 0; i < 7; i++) {
      cardsAux.add(monteAux_3[i]);
    }

    //Quarto monte
    for (int i = 0; i < 7; i++) {
      cardsAux.add(monteAux_4[i]);
    }

    //Quinto monte
    for (int i = 0; i < 7; i++) {
      cardsAux.add(monteAux_5[i]);
    }

    varAux = 0;

    monte_1.clear();
    monte_2.clear();
    monte_3.clear();
    monte_4.clear();
    monte_5.clear();

    monte_1_mentiroso.clear();
    monte_2_mentiroso.clear();
    monte_3_mentiroso.clear();
    monte_4_mentiroso.clear();
    monte_5_mentiroso.clear();

    for (int i = 34; i >= 0; i--) {
      if (varAux == 0) {
        monte_1.add(cardsAux[i]);
        monte_1_mentiroso.add(cardsAux[i]);
        varAux++;
        continue;
      } else if (varAux == 1) {
        monte_2.add(cardsAux[i]);
        monte_2_mentiroso.add(cardsAux[i]);
        varAux++;
        continue;
      } else if (varAux == 2) {
        monte_3.add(cardsAux[i]);
        monte_3_mentiroso.add(cardsAux[i]);
        varAux++;
        continue;
      } else if (varAux == 3) {
        monte_4.add(cardsAux[i]);
        monte_4_mentiroso.add(cardsAux[i]);
        varAux++;
        continue;
      } else if (varAux == 4) {
        monte_5.add(cardsAux[i]);
        monte_5_mentiroso.add(cardsAux[i]);
        varAux = 0;
        continue;
      }
    }

    cardsAux.clear();

    if (etapa == 1) {
      monte_1_mentiroso.shuffle();
      monte_2_mentiroso.shuffle();
      monte_3_mentiroso.shuffle();
      monte_4_mentiroso.shuffle();
      monte_5_mentiroso.shuffle();

      for (int i = 0; i < 7; i++) {
        cardsAux.add(monte_1_mentiroso[i]);
      }

      //Segundo monte
      for (int i = 0; i < 7; i++) {
        cardsAux.add(monte_2_mentiroso[i]);
      }

      //Terceiro monte
      for (int i = 0; i < 7; i++) {
        cardsAux.add(monte_3_mentiroso[i]);
      }

      //Quarto monte
      for (int i = 0; i < 7; i++) {
        cardsAux.add(monte_4_mentiroso[i]);
      }

      //Quinto monte
      for (int i = 0; i < 7; i++) {
        cardsAux.add(monte_5_mentiroso[i]);
      }
    } else {
      //Primeiro monte
      for (int i = 0; i < 7; i++) {
        cardsAux.add(monte_1[i]);
      }

      //Segundo monte
      for (int i = 0; i < 7; i++) {
        cardsAux.add(monte_2[i]);
      }

      //Terceiro monte
      for (int i = 0; i < 7; i++) {
        cardsAux.add(monte_3[i]);
      }

      //Quarto monte
      for (int i = 0; i < 7; i++) {
        cardsAux.add(monte_4[i]);
      }

      //Quinto monte
      for (int i = 0; i < 7; i++) {
        cardsAux.add(monte_5[i]);
      }
    }

    setState(() {
      cards = cardsAux;
      comecou = true;
    });

    if (etapa == 0) {
      //Etapa 1
      etapa++;
    } else if (etapa == 1) {
      //Etapa 2 -- AQUI QUE VOU APRIMORAR
      etapa++;
    } else {
      //Etapa 3
      setState(() {
        cartaResultado = monte_3[3];
        resultado = true;
      });
    }
  }

  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 15));

  int totalMontes = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Magic Flutter'),
        actions: [
          PopupMenuButton(
            offset: const Offset(0, 40),
            elevation: 2,
            itemBuilder: (_) => [3, 5, 7]
                .map(
                  (num) => CheckedPopupMenuItem(
                    value: num,
                    checked: totalMontes == num,
                    child: Text("$num fileiras"),
                  ),
                )
                .toList(),
            onSelected: (number) {
              setState(() {
                totalMontes = number;
                print("fileiras: $number");
              });
              //dataService.numberOfItems = number;
            },
          )
        ],
      ),
      body: resultado
          ? SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'Será que acertei sua carta?',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    BlinkingImage(
                        largura: 226,
                        altura: 314,
                        circulo: 0,
                        url: cartaResultado),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      style: style,
                      onPressed: () {
                        iniciarMagica();
                      },
                      child: const Text('Tentar novamente!'),
                    ),
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        constraints: const BoxConstraints(
                          maxWidth: 350,
                          maxHeight: 60,
                        ),
                        color: Colors.purple,
                        child: Card(
                          child: ListTile(
                            leading: Image.asset("images/susu.jpg"),
                            title: const Text('Sueliton Medeiros'),
                            trailing: const Icon(Icons.favorite),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Center(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 100,
                      padding: const EdgeInsets.all(10),
                      child: Center(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.purple,
                            child: Text("${etapa + 1}/3"),
                          ),
                          title: Text(
                            msgsTitle[etapa],
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            msgsDescription[etapa],
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Divider(color: Colors.purple),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: SizedBox(
                        //color: Colors.green[200],
                        width: 580,
                        height: 435,
                        child: Stack(
                          children: [
                            // Monte 1
                            for (int i = 0; i < 7; i++)
                              Positioned(
                                left: 0,
                                top: i * 40,
                                width: 100,
                                child: GestureDetector(
                                  onTap: () {
                                    escolherMonte(1);
                                  },
                                  child: Image.asset(
                                    cards[i],
                                  ),
                                ),
                              ),
                            // Monte 2
                            for (int i = 7; i < 14; i++)
                              Positioned(
                                left: 120,
                                top: (i - 7) * 40,
                                width: 100,
                                child: GestureDetector(
                                  onTap: () {
                                    escolherMonte(2);
                                  },
                                  child: Image.asset(
                                    cards[i],
                                  ),
                                ),
                              ),
                            // Monte 3
                            for (int i = 14; i < 21; i++)
                              Positioned(
                                left: 240,
                                top: (i - 14) * 40,
                                width: 100,
                                child: GestureDetector(
                                  onTap: () {
                                    escolherMonte(3);
                                  },
                                  child: Image.asset(
                                    cards[i],
                                  ),
                                ),
                              ),

                            //Monte 4
                            for (int i = 21; i < 28; i++)
                              Positioned(
                                left: 360,
                                top: (i - 21) * 40,
                                width: 100,
                                child: GestureDetector(
                                  onTap: () {
                                    escolherMonte(4);
                                  },
                                  child: Image.asset(
                                    cards[i],
                                  ),
                                ),
                              ),

                            //Monte 5
                            for (int i = 28; i < 35; i++)
                              Positioned(
                                left: 480,
                                top: (i - 28) * 40,
                                width: 100,
                                child: GestureDetector(
                                  onTap: () {
                                    escolherMonte(5);
                                  },
                                  child: Image.asset(
                                    cards[i],
                                  ),
                                ),
                              ),

                            Positioned(
                              left: 5,
                              top: 385,
                              child: Center(
                                child: ElevatedButton(
                                  style: style,
                                  onPressed: () {
                                    escolherMonte(1);
                                  },
                                  child: const Text('Escolher'),
                                ),
                              ),
                            ),

                            Positioned(
                              left: 125,
                              top: 385,
                              child: Center(
                                child: ElevatedButton(
                                  style: style,
                                  onPressed: () {
                                    escolherMonte(2);
                                  },
                                  child: const Text('Escolher'),
                                ),
                              ),
                            ),

                            Positioned(
                              left: 245,
                              top: 385,
                              child: Center(
                                child: ElevatedButton(
                                  style: style,
                                  onPressed: () {
                                    escolherMonte(3);
                                  },
                                  child: const Text('Escolher'),
                                ),
                              ),
                            ),

                            Positioned(
                              left: 365,
                              top: 385,
                              child: Center(
                                child: ElevatedButton(
                                  style: style,
                                  onPressed: () {
                                    escolherMonte(4);
                                  },
                                  child: const Text('Escolher'),
                                ),
                              ),
                            ),

                            Positioned(
                              left: 485,
                              top: 385,
                              child: Center(
                                child: ElevatedButton(
                                  style: style,
                                  onPressed: () {
                                    escolherMonte(5);
                                  },
                                  child: const Text('Escolher'),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Divider(color: Colors.purple),
                    comecou
                        ? Container(
                            //color: Colors.amber,
                            width: double.infinity,
                            height: 80,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(20),
                            child: IconButton(
                              icon: const Icon(Icons.refresh),
                              tooltip: 'Recomeçar',
                              onPressed: () {
                                iniciarMagica();
                              },
                            ),
                          )
                        : Container(
                            //color: Colors.amber,
                            width: double.infinity,
                            height: 80,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(20),
                            child: const Text(
                                'Desenvolvido por: Sueliton Medeiros'),
                          ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget buildCardRow(List<String> pile) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (String cardUrl in pile)
            Padding(
              padding: const EdgeInsets.all(2),
              child: Image.network(
                cardUrl,
                width: 120,
              ),
            ),
        ],
      ),
    );
  }
}

class BlinkingImage extends StatefulWidget {
  final String url;
  final double largura;
  final double altura;
  final double circulo;

  BlinkingImage(
      {required this.largura,
      required this.altura,
      required this.circulo,
      required this.url});

  @override
  _BlinkingImageState createState() => _BlinkingImageState();
}

class _BlinkingImageState extends State<BlinkingImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    )..repeat(reverse: true);
    _opacityAnimation = Tween<double>(
      begin: 0.4,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _opacityAnimation,
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: Container(
            width: widget.largura,
            height: widget.altura,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.url),
                fit: BoxFit.contain,
              ),
              borderRadius: BorderRadius.circular(widget.circulo),
            ),
          ),
        );
      },
    );
  }
}
