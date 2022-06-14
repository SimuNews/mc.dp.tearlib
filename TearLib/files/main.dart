import 'package:objd/core.dart';

class MainFile extends Widget {
  /// The main file is put in a seperate widget to split the code in several files
  MainFile();

  static const String SCORE_TEAR_ID = "TearId";
  static const String TAG_TEARLIB = "TearLib";
  static const String TAG_TEAR_ID = TAG_TEARLIB + "_ID";

  static Score REG_TEAR_ID =
      Score(Entity.PlayerName("#TearLibID"), SCORE_TEAR_ID);

  @override
  Widget generate(Context context) {
    return For.of([
      // put your tick widgets here
      Comment.FileHeader(
        "Give each joined player a unique ID",
        author: "SimuNews",
      ),

      ////////////////////////////////////////////////////////////////////////

      Execute(
        as: Entity.All(),
        unless: Condition.score(
          Score.fromSelected(
            SCORE_TEAR_ID,
          ).isBigger(
            Score.con(0),
          ),
        ),
        children: [
          Group(children: [
            Score.fromSelected(SCORE_TEAR_ID).setEqual(
              REG_TEAR_ID,
            ),
            REG_TEAR_ID.add(1),
          ], groupMin: 0),
        ],
      )
    ]);
  }
}
