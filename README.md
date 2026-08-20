# CPS IRC App

The complete IRC application built from the CPS runtime, IRC client, bouncer,
terminal UI, and native GUI packages. The repository contains two frontends
over the same protocol stack:

- A full terminal client for macOS and Linux.
- A native SwiftUI client generated from the CPS GUI DSL.

The application is kept separate from `cps-irc` so the protocol library stays
small and reusable.

## Features

- Multi-server connections and saved profiles
- TLS and SASL authentication
- IRCv3 capabilities, server-time, batches, and modern network extensions
- Channel/query switching, unread counts, mentions, topic and user lists
- DCC transfers and XDCC workflows
- Message search, logging, ignore lists, highlights, and themes
- Mouse input, scrolling, draggable panes, and keyboard navigation in the TUI
- Optional local bouncer discovery, authentication, history replay, and detach
- Native SwiftUI views with a typed Nim bridge
- Auto-reconnect and configurable quit messages

## Requirements

- Nim 2.0 or newer
- macOS or Linux for the terminal client
- macOS with Xcode for the generated native client

## Install dependencies

```sh
git clone https://github.com/gabearro/cps-irc-app
cd cps-irc-app
nimble install -d -y
```

The application packages are also installable directly:

```sh
nimble install https://github.com/gabearro/cps-irc-app@#v1.0.0
```

## Run the terminal client

```sh
nim c -r examples/tui/irc_tui.nim
```

Connect directly from the command line:

```sh
nim c -r examples/tui/irc_tui.nim \
  irc.libera.chat 6697 mynick "#nim"
```

Reset the saved configuration:

```sh
nim c -r examples/tui/irc_tui.nim --reset
```

The first run stores configuration under the platform configuration directory.
The terminal client supports common commands including `/join`, `/part`,
`/quit`, `/nick`, `/msg`, `/me`, `/topic`, and `/server`.

## Run the native client

After installing dependencies, invoke the GUI generator that Nimble installed:

```sh
nim c -r "$(nimble path cps_native_gui)/cps/gui/cli.nim" -- \
  run examples/gui/irc/app.gui --out out
```

The generator checks the `.gui` program, emits an Xcode project, builds the Nim
bridge, runs `xcodebuild`, and launches the resulting application.

## Native application structure

```text
examples/gui/irc/
  app.gui                 application state, models, actions, reducers
  bridge.nim              IRC runtime and native bridge implementation
  components/             channel list, chat, settings, transfers, users
  swift/                  focused native SwiftUI extensions
```

The generated UI uses native SwiftUI controls while connection state, IRC
events, persistence, bouncer integration, and transfers remain in Nim.

## Bouncer

The client can attach to
[cps-irc-bouncer](https://github.com/gabearro/cps-irc-bouncer) over its local
Unix socket. When the bouncer is unavailable, the application can connect
directly to IRC instead.

## Development

```sh
nimble test
```

The repository test verifies that the action tags and field IDs shared by the
GUI program and Nim bridge remain synchronized. The underlying protocol,
bouncer, TUI, and generator packages each run their own larger suites.

## License

MIT
