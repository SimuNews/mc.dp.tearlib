// import the core of the framework:
import 'package:objd/core.dart';
// import the custom pack:
import './packs/tearlib_pack.dart';

void main(List<String> args) {
  createProject(
      Project(
        name: 'TearLib',
        description: 'A library that need some datapacks to run',
        target: "../", // path for where to generate the project
        generate: TearLibPack(), // The starting point of generation
      ),
      args);
}
