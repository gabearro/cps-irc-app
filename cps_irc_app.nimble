version = "1.0.0"
author = "Gabriel Arroyo"
description = "Native and terminal IRC applications built with the CPS libraries."
license = "MIT"
srcDir = "."
skipDirs = @["tests", "benchmarks", ".github", "scripts"]

requires "nim >= 2.0.0"
requires "https://github.com/gabearro/cps-runtime#v1.0.0"
requires "https://github.com/gabearro/cps-tls#v1.0.0"
requires "https://github.com/gabearro/cps-irc#v1.0.0"
requires "https://github.com/gabearro/cps-irc-bouncer#v1.0.0"
requires "https://github.com/gabearro/cps-tui#v1.0.0"
requires "https://github.com/gabearro/cps-native-gui#v1.0.0"

task test, "Run the project test suite":
  exec "nim c -r tests/gui/test_irc_action_tag_sync.nim"
