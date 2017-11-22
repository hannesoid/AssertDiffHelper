# AssertDiffHelper

## Installation

### Install Kaleidoscope.app with command line tools `ksdiff`.

### Then compile this helper
```
$ swift build -c release -Xswiftc -static-stdlib
$ cp .build/release/AssertDiffHelper /usr/local/bin/assertdiffhelper 
```

### Add Automator script
Add a Automator Service receiving Text from any programm with input as arguments, and running a /bin/bash script:
```
/usr/local/bin/assertdiffhelper "$1"
```
