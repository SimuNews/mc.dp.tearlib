import 'package:objd/core.dart';

import '../logging/logger.dart';
import 'event.dart';

class PlayerEvents extends Event {
  PlayerEvents();

  static int IDENTIFIER = 1000;

  @override
  generate(Context context) {
    return For.of([
      // put your tick widgets here
      Comment.FileHeader(
        "Track playerevents for everyone",
      ),

      Comment("Player Jump Event"),

      Scoreboard("TearPlayerJump", type: "minecraft.custom:minecraft.jump"),
      Execute.as(
        Entity.All(),
        children: [
          If(
            Condition.score(
              Score.fromSelected("TearPlayerJump").isBigger(
                Score.con(0),
              ),
            ),
            then: [
              Logging.debug([
                TextComponent("Player Jump Event"),
              ]),
              Score.fromSelected("TearPlayerJump").set(
                0,
              ),
            ],
          ),
        ],
      ),
    ]);
  }
}
