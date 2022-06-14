import 'package:objd/core.dart';

import 'logging/logger.dart';

class LoadFile extends Widget {
  /// The load file is put in a seperate widget to split the code in several files
  LoadFile();

  static const String SCORE_TEAR_ID = "TearId";
  static const String TAG_TEARLIB = "TearLib";
  static const String TAG_TEAR_ID = TAG_TEARLIB + "_ID";

  static Score REG_TEAR_ID =
      Score(Entity.PlayerName("#TearLibID"), SCORE_TEAR_ID);
  static Score REG_CONST_ZERO = Score.con(0);

  @override
  Widget generate(Context context) {
    return For.of([
      // put your load widgets here

      Comment.FileHeader(
        "Handle all stuff after reloading",
        author: "SimuNews",
        context: "ReloadFile",
        calledFrom: "mineacraft/tick:load",
      ),

      // objD Consts
      For(
        create: (int index) {
          return Score.con(index);
        },
        to: 500,
      ),

      Scoreboard(
        "TearLib",
      ), // show other dp taht uses TearLib that its installed
      Scoreboard(SCORE_TEAR_ID), // give every player a unique id

      Comment("Check if it is a clean installation"),

      // Summon AEC when no ones around
      If(
        Condition.score(
          REG_TEAR_ID.isBigger(REG_CONST_ZERO),
        ),
        orElse: [
          REG_TEAR_ID.set(1),
          Logging.info([
            TextComponent("Installation successful. Configured for first use!"),
          ])
        ],
        then: [
          Logging.info([
            TextComponent("Reload successful. Restored old config"),
          ])
        ],
        assignTag: Entity.Player(),
      ),
    ]);
  }
}
