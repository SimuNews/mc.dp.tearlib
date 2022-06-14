import 'package:objd/core.dart';
// import all the files:
import '../files/load.dart';
import '../files/main.dart';

class TearLibPack extends Widget {
  /// There is a folder for all packs inside a project, It is recommended to give each pack an own widget
  TearLibPack();

  @override
  Widget generate(Context context) {
    return Pack(
        name: 'tearlib', // name of the subpack
        main: File(
            // definining a file that runs every tick
            'main',
            child: MainFile()),
        load: File(
            // definining a file that runs on reload
            'load',
            child: LoadFile()),
        modules: [],
        files: []);
  }
}
