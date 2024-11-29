import 'dart:math';

import 'package:flame/components.dart';
import 'package:flappy_bird/components/pipe.dart';
import 'package:flappy_bird/constants.dart';
import 'package:flappy_bird/game.dart';

class Pipemanager extends Component with HasGameRef<FlappyBirdGame> {
  double pipeSpawnerTimer = 0;

  void update(double dt) {
    pipeSpawnerTimer += dt;
    

    if (pipeSpawnerTimer > pipeInterval) {
      pipeSpawnerTimer = 0;
      spawnPipe();
    }
  }

  void spawnPipe() {
    final double screenHeight = gameRef.size.y;
    

    final double maxPipeHeight =
        screenHeight - pipeGap - minPipeHeight - groundHeight;

    final double bottomPipeHeight =
        minPipeHeight + Random().nextDouble() * (maxPipeHeight - minPipeHeight);

    final double topPipeHeight =
        screenHeight - groundHeight - bottomPipeHeight - pipeGap;

    final bottomPipe = Pipe(
        Vector2(gameRef.size.x, screenHeight - groundHeight - bottomPipeHeight),
        Vector2(pipeWidth, bottomPipeHeight),
        isTopPipe: false);

    final topPipe = Pipe(
        Vector2(gameRef.size.x, 0), Vector2(pipeWidth, topPipeHeight),
        isTopPipe: true);

    gameRef.add(bottomPipe);
    gameRef.add(topPipe);
  }
}
