import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isCrossTurn = true;

  // 0 = game continue
  // 1 = cross won
  // 2 = anda won
  // 3 = game over and tie

  int gameState = 0;

  List<List> state_data = [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0],
  ];

  int wonCheck() {
    if (state_data[0][0] != 0 &&
        state_data[0][1] != 0 &&
        state_data[0][2] != 0 &&
        state_data[1][0] != 0 &&
        state_data[1][1] != 0 &&
        state_data[1][2] != 0 &&
        state_data[2][0] != 0 &&
        state_data[2][1] != 0 &&
        state_data[2][2] != 0) {
      return 3;
    } else if (state_data[0][0] + state_data[0][1] + state_data[0][2] == 3 ||
        state_data[1][0] + state_data[1][1] + state_data[1][2] == 3 ||
        state_data[2][0] + state_data[2][1] + state_data[2][2] == 3 ||
        state_data[0][0] + state_data[1][0] + state_data[2][0] == 3 ||
        state_data[0][1] + state_data[1][1] + state_data[2][1] == 3 ||
        state_data[0][2] + state_data[1][2] + state_data[2][2] == 3 ||
        state_data[0][0] + state_data[1][1] + state_data[2][2] == 3 ||
        state_data[2][0] + state_data[1][1] + state_data[0][2] == 3) {
      return 1;
    } else if (state_data[0][0] + state_data[0][1] + state_data[0][2] == 15 ||
        state_data[1][0] + state_data[1][1] + state_data[1][2] == 15 ||
        state_data[2][0] + state_data[2][1] + state_data[2][2] == 15 ||
        state_data[0][0] + state_data[1][0] + state_data[2][0] == 15 ||
        state_data[0][1] + state_data[1][1] + state_data[2][1] == 15 ||
        state_data[0][2] + state_data[1][2] + state_data[2][2] == 15 ||
        state_data[0][0] + state_data[1][1] + state_data[2][2] == 15 ||
        state_data[2][0] + state_data[1][1] + state_data[0][2] == 15) {
      return 2;
    }
    return 0;
  }

  void fillUp(int x, int y) {
    setState(() {
      if (state_data[x][y] == 0) {
        if (isCrossTurn) {
          state_data[x][y] = 1;
          isCrossTurn = false;
        } else {
          state_data[x][y] = 5;
          isCrossTurn = true;
        }
      }
      gameState = wonCheck();
      print(state_data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: gameState != 0
            ? FloatingActionButton(
                onPressed: () {
                  setState(() {
                    state_data = [
                      [0, 0, 0],
                      [0, 0, 0],
                      [0, 0, 0],
                    ];
                    gameState = 0;
                  });
                },
                child: Icon(Icons.refresh,),
              )
            : Text(""),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Text.rich(
                        TextSpan(
                            text: "Turn of ",
                            style: TextStyle(
                                fontSize: 40.0,
                                color: Colors.black54,
                                fontWeight: FontWeight.w600),
                            children: [
                              isCrossTurn
                                  ? TextSpan(
                                      text: " X",
                                      style: TextStyle(
                                          fontSize: 60,
                                          color: Colors.redAccent,
                                          fontWeight: FontWeight.w400),
                                    )
                                  : TextSpan(
                                      text: " O",
                                      style: TextStyle(
                                          fontSize: 60,
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.w400),
                                    ),
                            ]),
                      ),
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: MediaQuery.of(context).size.width * 0.85,
                        child: GridView.count(
                          crossAxisCount: 3,
                          mainAxisSpacing: 8.0,
                          crossAxisSpacing: 8.0,
                          clipBehavior: Clip.hardEdge,
                          children: [
                            GestureDetector(
                              onTap: () => fillUp(0, 0),
                              child: showBlock(state_data[0][0]),
                            ),
                            GestureDetector(
                              onTap: () => fillUp(0, 1),
                              child: showBlock(state_data[0][1]),
                            ),
                            GestureDetector(
                              onTap: () => fillUp(0, 2),
                              child: showBlock(state_data[0][2]),
                            ),
                            GestureDetector(
                              onTap: () => fillUp(1, 0),
                              child: showBlock(state_data[1][0]),
                            ),
                            GestureDetector(
                              onTap: () => fillUp(1, 1),
                              child: showBlock(state_data[1][1]),
                            ),
                            GestureDetector(
                              onTap: () => fillUp(1, 2),
                              child: showBlock(state_data[1][2]),
                            ),
                            GestureDetector(
                              onTap: () => fillUp(2, 0),
                              child: showBlock(state_data[2][0]),
                            ),
                            GestureDetector(
                              onTap: () => fillUp(2, 1),
                              child: showBlock(state_data[2][1]),
                            ),
                            GestureDetector(
                              onTap: () => fillUp(2, 2),
                              child: showBlock(state_data[2][2]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            gameState != 0
                ? Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.black.withOpacity(0.9),
                    child: Center(
                      child: gameState == 1
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "X",
                                  style: TextStyle(
                                    fontSize: 90,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "WINNER!",
                                  style: TextStyle(
                                    fontSize: 50,
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            )
                          : gameState == 2
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "O",
                                      style: TextStyle(
                                        fontSize: 90,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      "WINNER!",
                                      style: TextStyle(
                                        fontSize: 50,
                                        color: Colors.white70,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "X ",
                                            style: TextStyle(
                                              fontSize: 90,
                                              color: Colors.redAccent,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          TextSpan(
                                            text: " O",
                                            style: TextStyle(
                                              fontSize: 90,
                                              color: Colors.blueAccent,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      "DRAW!",
                                      style: TextStyle(
                                        fontSize: 50,
                                        color: Colors.white70,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                    ),
                  )
                : Text(""),
          ],
        ),
      ),
    );
  }
}

class CroosBlock extends StatelessWidget {
  const CroosBlock({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.5),
      child: Icon(
        Icons.close_rounded,
        size: 80,
        color: Colors.red,
      ),
    );
  }
}

class AnddaBlock extends StatelessWidget {
  const AnddaBlock({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.5),
      child: Icon(
        Icons.lens_outlined,
        size: 80,
        color: Colors.blue,
      ),
    );
  }
}

class EmptyBlock extends StatelessWidget {
  const EmptyBlock({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.5),
    );
  }
}

Widget showBlock(int state) {
  if (state == 0) {
    return EmptyBlock();
  } else if (state == 1) {
    return CroosBlock();
  } else {
    return AnddaBlock();
  }
}
