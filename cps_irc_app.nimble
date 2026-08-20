version = "1.0.0"
author = "Gabriel Arroyo"
description = "Native and terminal IRC applications built with the CPS libraries."
license = "MIT"
srcDir = "."
skipDirs = @["tests", "benchmarks", ".github", "scripts"]

requires "nim >= 2.0.0"
requires "https://github.com/gabearro/cps-runtime == 1.0.0"
requires "https://github.com/gabearro/cps-tls == 1.0.0"
requires "https://github.com/gabearro/cps-irc == 1.0.0"
requires "https://github.com/gabearro/cps-irc-bouncer == 1.0.0"
requires "https://github.com/gabearro/cps-tui == 1.0.0"
requires "https://github.com/gabearro/cps-native-gui == 1.0.0"

task test, "Run the project test suite":
  exec "nim c -r tests/gui/test_irc_action_tag_sync.nim"
