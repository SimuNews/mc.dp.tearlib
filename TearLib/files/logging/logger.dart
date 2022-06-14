import 'package:objd/core.dart';

class Logging extends Widget {
  List<TextComponent> message = [];

  Logging.error(this.message) {
    message.insert(
      0,
      TextComponent("[TearLib]: [Error] ", color: Color.DarkRed),
    );
  }

  Logging.warning(this.message) {
    message.insert(
      0,
      TextComponent("[TearLib]: [Warning] ", color: Color.Gold),
    );
  }

  Logging.debug(this.message) {
    message.insert(
      0,
      TextComponent("[TearLib]: [Debug] ", color: Color.DarkAqua),
    );
  }

  Logging.info(this.message) {
    message.insert(
      0,
      TextComponent("[TearLib]: [Info] ", color: Color.Green),
    );
  }

  @override
  generate(Context context) {
    return Tellraw(Entity.All(), show: message);
  }
}
