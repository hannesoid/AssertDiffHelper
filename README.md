# AssertDiffHelper

## What this does after following installation instructions

Click on XCTAssertEqual test failures, select the text, command-click and select the service 'Diff in Kaleidoscope' which splits the string and compares it in Kaleidoscope.

## Alternatives

[krzysztofzablocki/Difference](https://github.com/krzysztofzablocki/Difference)

## Installation

### Install [Kaleidoscope.app](https://www.kaleidoscopeapp.com) and its command line tools `ksdiff`

### Then download/clone and compile this helper

```
$ swift build -c release -Xswiftc -static-stdlib
$ cp .build/release/AssertDiffHelper /usr/local/bin/assertdiffhelper
```

### Add Automator script

Add a Automator Service receiving Text from any programm with input **as arguments** (not stdin), and running a '/bin/bash' script:

```
/usr/local/bin/assertdiffhelper "$1"
```

## To Edit in Xcode

```
$ swift package generate-xcodeproj
```
Then open the created Xcode project.

### Acknowledgements

This uses [Files](https://github.com/johnsundell/files).

