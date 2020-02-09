import 'package:flutter/material.dart';
import 'package:flutter_game/constants.dart';
import 'package:flutter_game/game/game.dart';
import 'package:flutter_game/game/grid.dart';
import 'package:flutter_game/prefs/shared_preferences.dart';
import 'package:flutter_game/styles/colors.dart';
import 'package:flutter_game/widgets/number_block.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<List<int>> grid;
  List<List<int>> newGrid;

  int score = 0;

  bool isGameOverStatus = false;
  bool isGameWonStatus = false;

  List<Widget> getGridWidgets(double width, double height) {
    List<Widget> widgetsList = [];

    for (int i = 0; i < GRID_SIZE; i++) {
      for (int j = 0; j < GRID_SIZE; j++) {
        widgetsList.add(
          NumberBlock(
            number: grid[i][j].toString(),
            width: width,
            height: height,
          ),
        );
      }
    }
    return widgetsList;
  }

  @override
  void initState() {
    grid = getBlankGrid();
    newGrid = getBlankGrid();
    addNumber(grid, newGrid);
    addNumber(grid, newGrid);
    super.initState();
  }

  Widget getCurrentScoreWidget() => Center(
        child: Container(
          color: gridBackground,
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Text(
                'Score',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                score.toString(),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );

  Widget getGameGridWidget(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double gridWidth = (width - 80) / GRID_SIZE;
    double gridHeight = gridWidth;
    double height = 30 + (gridHeight * GRID_SIZE) + 10;
    return Container(
      height: height,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: GestureDetector(
              child: GridView.count(
                primary: false,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                crossAxisCount: GRID_SIZE,
                children: getGridWidgets(gridWidth, gridHeight),
              ),
              onVerticalDragEnd: (DragEndDetails details) {
                /// PrimaryVelocity -ve up +ve down
                if (details.primaryVelocity < 0) {
                  handleGesture(0);
                } else if (details.primaryVelocity > 0) {
                  handleGesture(1);
                }
              },
              onHorizontalDragEnd: (details) {
                /// PV -ve right, +ve left
                if (details.primaryVelocity > 0) {
                  handleGesture(2);
                } else if (details.primaryVelocity < 0) {
                  handleGesture(3);
                }
              },
            ),
          ),
          getGameOverWidget(height),
          getGameWonWidget(height),
        ],
      ),
      color: gridBackground,
    );
  }

  Widget getGameOverWidget(double height) => isGameOverStatus
      ? Container(
          height: height,
          color: transparentWhite,
          child: Center(
            child: Text(
              'Game Over!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: emptyGridBackground,
              ),
            ),
          ),
        )
      : Container();

  Widget getGameWonWidget(double height) => isGameWonStatus
      ? Container(
          height: height,
          color: transparentWhite,
          child: Center(
            child: Text(
              'You Won!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: emptyGridBackground,
              ),
            ),
          ),
        )
      : Container();

  Widget getBottomRowWidgets() => Container(
        padding: EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: gridBackground,
              ),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: IconButton(
                  iconSize: 32,
                  icon: Icon(
                    Icons.refresh,
                    color: Colors.white70,
                  ),
                  onPressed: () {
                    setState(() {
                      grid = getBlankGrid();
                      newGrid = getBlankGrid();
                      grid = addNumber(grid, newGrid);
                      grid = addNumber(grid, newGrid);
                      score = 0;
                      isGameWonStatus = false;
                      isGameOverStatus = false;
                    });
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: gridBackground,
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    'High Score',
                    style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
                  ),
                  FutureBuilder<String>(
                    future: SharedPrefs().getHighScore(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          snapshot.data,
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        );
                      } else {
                        return Text(
                          '0',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        );
                      }
                    },
                  )
                ],
              ),
            )
          ],
        ),
      );

  void handleGesture(int direction) {
    bool flipped = false;
    bool played = true;
    bool rotated = false;

    if (direction == 0) {
      setState(() {
        grid = transposeGrid(grid);
        grid = flipGrid(grid);
        rotated = true;
        flipped = true;
      });
    } else if (direction == 1) {
      setState(() {
        grid = transposeGrid(grid);
        rotated = true;
      });
    } else if (direction == 2) {
    } else if (direction == 3) {
      setState(() {
        grid = flipGrid(grid);
        flipped = true;
      });
    } else {
      played = false;
    }

    if (played) {
      print('PLAYED');

      List<List<int>> previousGrid = copyGrid(grid);
      print('PREVIOUS GRID ${previousGrid}');

      for (int i = 0; i < GRID_SIZE; i++) {
        setState(() {
          List result = operate(grid[i], score);
          score = result[0];
          print('NEW SCORE IN SET STATE ${score}');
          grid[i] = result[1];
        });
      }
      setState(() {
        grid = addNumber(grid, newGrid);
      });

      bool changed = compare(previousGrid, grid);
      print('GRID CHANGE => $changed');
      if (flipped) {
        setState(() {
          grid = flipGrid(grid);
        });
      }

      if (rotated) {
        setState(() {
          grid = transposeGrid(grid);
        });
      }

      if (changed) {
        setState(() {
          grid = addNumber(grid, newGrid);
          print('GRID CHANGED');
        });
      } else {
        print('GRID NOT CHANGED');
      }

      if (isGameOver(grid)) {
        print('GAME OVER!');
        setState(
          () {
            isGameOverStatus = true;
          },
        );
      }

      if (isGameWon(grid)) {
        print("GAME WON");
        setState(
          () {
            isGameWonStatus = true;
          },
        );
      }
      print('GRID => $grid');
      print('SCORE => $score');
    }
  }

  @override
  Widget build(BuildContext context) => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            getCurrentScoreWidget(),
            SizedBox(height: 16),
            getGameGridWidget(context),
            getBottomRowWidgets(),
          ],
        ),
      );
}
