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
  @override
  void initState() {
    super.initState();
    iniciarMagica();
  }

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

  static List<String> cardsBackup = [
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

  int etapa = 0;
  int varAux = 0;
  bool resultado = false;
  bool comecou = false;
  String cartaResultado = "";

  List<List<String>> montes = [];
  List<List<String>> montesMentirosos = [];
  List<List<String>> montesAuxiliares = [];
  List<String> cardsResto = [];

  List<String> filterMont = [];

  void codeSusu(List<String> monteEscolhido) {
    if (etapa == 0) {
      filterMont.clear();

      for (int i = 0; i < 7; i++) {
        filterMont.add(monteEscolhido[i]);
      }

      //print("Etapa 1: $filterMont");
    } else if (etapa == 1) {
      //Etapa 2

      List<String> elementosComuns = monteEscolhido
          .where((elemento) => filterMont.contains(elemento))
          .toList();

      filterMont = elementosComuns;
      //print("Etapa 2: $filterMont");
    }
  }

  int totalCartas = 35;

  void iniciarMagica() {
    cards.clear();
    for (int i = 0; i < cardsBackup.length; i++) {
      cards.add(cardsBackup[i]);
    }

    cards.shuffle();

    montes.clear();
    montesAuxiliares.clear();
    montesMentirosos.clear();

    totalCartas = (totalMontes * 7).round();
    //------------------- 3     * 7 = 21
    //------------------- 5     * 7 = 35
    //------------------- 7     * 7 = 42

    for (int i = 0; i < totalMontes; i++) {
      montes.add([]);
      montesAuxiliares.add([]);
      montesMentirosos.add([]);
    }

    for (int i = 0; i < totalCartas; i++) {
      if (i >= 0 && i < 7) {
        //Monte 1
        montes[0].add(cards[i]);
      } else if (i >= 7 && i < 14) {
        //Monte 2
        montes[1].add(cards[i]);
      } else if (i >= 14 && i < 21) {
        //Monte 3
        montes[2].add(cards[i]);
      } else if (i >= 21 && i < 28) {
        //Monte 4
        montes[3].add(cards[i]);
      } else if (i >= 28 && i < 35) {
        //Monte 5
        montes[4].add(cards[i]);
      } else if (i >= 35 && i < 42) {
        //Monte 6
        montes[5].add(cards[i]);
      } else if (i >= 42 && i < 49) {
        //Monte 7
        montes[6].add(cards[i]);
      }

      if (i == totalCartas - 1) {
        break;
      }
    }

    setState(() {
      etapa = 0;
      resultado = false;
      varAux = 0;
      comecou = false;
    });
  }

  int getMetade() {
    switch (totalMontes) {
      case 3:
        return 1; //2-1

      case 5:
        return 2; //3-1

      case 7:
        return 3; //4-1
    }
    return 0;
  }

  int metade = 0;
  bool adivinhouFacil = false;

  void escolherMonte(int monteNumber) {
    cardsAux.clear();
    metade = getMetade();
    adivinhouFacil = false;

    if (etapa <= 1) {
      codeSusu(montes[monteNumber - 1]);
      if (filterMont.length == 1) {
        adivinhouFacil = true;
      }
    }

    if (adivinhouFacil) {
      setState(() {
        cartaResultado = filterMont.first;
        resultado = true;
      });
    } else {
//Limpa os montes auxiliares
      for (int i = 0; i < totalMontes; i++) {
        montesAuxiliares[i].clear();
      }

      for (int i = 0; i < 7; i++) {
        montesAuxiliares[metade].add(montes[monteNumber - 1][i]);
      }

      montes[monteNumber - 1].clear();

      //Vou percorrer os montes
      for (int i = 0; i < totalMontes; i++) {
        //Caso o monte não esteja vazio
        if (montes[i].isNotEmpty) {
          //Vou percorrer os montes auxiliares em busca de um vazio
          for (int x = 0; x < totalMontes; x++) {
            if (montesAuxiliares[x].isEmpty) {
              for (int y = 0; y < 7; y++) {
                montesAuxiliares[x].add(montes[i][y]);
              }
              montes[i].clear();
              break;
            }
          }
        }
      }

      for (int i = 0; i < totalMontes; i++) {
        montesMentirosos[i].clear();
        for (int x = 0; x < 7; x++) {
          cardsAux.add(montesAuxiliares[i][x]);
        }
      }

      varAux = 0;

      for (int i = totalCartas - 1; i >= 0; i--) {
        if (varAux == totalMontes - 1) {
          montes[totalMontes - 1].add(cardsAux[i]);
          montesMentirosos[totalMontes - 1].add(cardsAux[i]);
          varAux = 0;
          continue;
        } else {
          montes[varAux].add(cardsAux[i]);
          montesMentirosos[varAux].add(cardsAux[i]);
          varAux++;
          continue;
        }
      }

      cardsAux.clear();

      if (etapa == 1) {
        for (int i = 0; i < totalMontes; i++) {
          montesMentirosos[i].shuffle();
          for (int x = 0; x < 7; x++) {
            cardsAux.add(montesMentirosos[i][x]);
          }
        }
      } else {
        for (int i = 0; i < totalMontes; i++) {
          for (int x = 0; x < 7; x++) {
            cardsAux.add(montes[i][x]);
          }
        }
      }

      setState(() {
        cards = cardsAux;
        comecou = true;
      });

      if (etapa <= 1) {
        etapa++;
      } else {
        setState(() {
          cartaResultado = montes[metade][3];
          resultado = true;
        });
      }
    }
  }

  final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 15),
      minimumSize: const Size(106, 40));

  int totalMontes = 5;
  double larguraCont = 580;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Magic Flutter'),
        centerTitle: true,
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
                larguraCont = (number * 120) - 20;
                //print("fileiras: $number");
                iniciarMagica();
              });
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
                      child: Container(
                        //color: Colors.green[200],
                        width: larguraCont,
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

                            Positioned(
                              left: 0,
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

                            Positioned(
                              left: 120,
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

                            Positioned(
                              left: 240,
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

                            //Monte 4

                            for (int i = 21; i < 28; i++)
                              Visibility(
                                visible: totalMontes >= 5,
                                child: Positioned(
                                  left: 360,
                                  top: (i - 21) * 40,
                                  width: 100,
                                  child: GestureDetector(
                                    onTap: () {
                                      escolherMonte(4);
                                    },
                                    child: Image.asset(
                                      (totalMontes >= 5)
                                          ? cards[i]
                                          : cardsBackup[i],
                                    ),
                                  ),
                                ),
                              ),

                            Visibility(
                              visible: totalMontes >= 5,
                              child: Positioned(
                                left: 360,
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
                            ),

                            //Monte 5
                            for (int i = 28; i < 35; i++)
                              Visibility(
                                visible: totalMontes >= 5,
                                child: Positioned(
                                  left: 480,
                                  top: (i - 28) * 40,
                                  width: 100,
                                  child: GestureDetector(
                                    onTap: () {
                                      escolherMonte(5);
                                    },
                                    child: Image.asset(
                                      (totalMontes >= 5)
                                          ? cards[i]
                                          : cardsBackup[i],
                                    ),
                                  ),
                                ),
                              ),

                            Visibility(
                              visible: totalMontes >= 5,
                              child: Positioned(
                                left: 480,
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
                              ),
                            ),

                            //Monte 6
                            for (int i = 35; i < 42; i++)
                              Visibility(
                                visible: totalMontes == 7,
                                child: Positioned(
                                  left: 600,
                                  top: (i - 35) * 40,
                                  width: 100,
                                  child: GestureDetector(
                                    onTap: () {
                                      escolherMonte(6);
                                    },
                                    child: Image.asset(
                                      (totalMontes == 7)
                                          ? cards[i]
                                          : cardsBackup[i],
                                    ),
                                  ),
                                ),
                              ),

                            Visibility(
                              visible: totalMontes == 7,
                              child: Positioned(
                                left: 600,
                                top: 385,
                                child: Center(
                                  child: ElevatedButton(
                                    style: style,
                                    onPressed: () {
                                      escolherMonte(6);
                                    },
                                    child: const Text('Escolher'),
                                  ),
                                ),
                              ),
                            ),

                            //Monte 7
                            for (int i = 42; i < 49; i++)
                              Visibility(
                                visible: totalMontes >= 7,
                                child: Positioned(
                                  left: 720,
                                  top: (i - 42) * 40,
                                  width: 100,
                                  child: GestureDetector(
                                    onTap: () {
                                      escolherMonte(7);
                                    },
                                    child: Image.asset(
                                      (totalMontes == 7)
                                          ? cards[i]
                                          : cardsBackup[i],
                                    ),
                                  ),
                                ),
                              ),

                            Visibility(
                              visible: totalMontes == 7,
                              child: Positioned(
                                left: 720,
                                top: 385,
                                child: Center(
                                  child: ElevatedButton(
                                    style: style,
                                    onPressed: () {
                                      escolherMonte(7);
                                    },
                                    child: const Text('Escolher'),
                                  ),
                                ),
                              ),
                            ),
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
