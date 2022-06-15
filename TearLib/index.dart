// import the core of the framework:
import 'package:objd/core.dart';
// import the custom pack:
import './packs/tearlib_pack.dart';

void main(List<String> args) {
  createProject(
      Project(
        name: 'TearLib',
        description: 'A library that need some datapacks to run',
        target:
            "C:/Users/SimuNews/AppData/Roaming/.minecraft/saves/New World/datapacks/", // path for where to generate the project
        generate: TearLibPack(), // The starting point of generation
        version: 19, // The version of the project
      ),
      args);
}
