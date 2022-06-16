import 'package:objd/core.dart';

class Logging extends Widget {
  List<TextComponent> message = [];
  int level;

  Logging(this.message, {this.level = 0});

  Logging.error(this.message) {
    message.insert(
      0,
      TextComponent("[TearLib]: [Error] ", color: Color.DarkRed),
    );
    level = 2;
  }

  Logging.warning(this.message) {
    message.insert(
      0,
      TextComponent("[TearLib]: [Warning] ", color: Color.Gold),
    );
    level = 3;
  }

  Logging.debug(this.message) {
    message.insert(
      0,
      TextComponent("[TearLib]: [Debug] ", color: Color.DarkAqua),
    );
    level = 4;
  }

  Logging.info(this.message) {
    message.insert(
      0,
      TextComponent("[TearLib]: [Info] ", color: Color.Green),
    );
    level = 1;
  }

  @override
  generate(Context context) {
    return For.of([
      If(
        Condition.score(
          Score(
            Entity.PlayerName("#TearLibConfig"),
            "TearLibLogLevel",
          ).isBiggerOrEqual(
            Score.con(level),
          ),
        ),
        then: [
          Tellraw(Entity.All(), show: message),
        ],
      ),
    ]);
  }
}
