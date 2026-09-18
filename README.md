# WebView lab

An iOS teaching application used for hands-on exercises about displaying web
content and defining the boundary between a web page and native application
code.

## Requirements

- Xcode 27 or newer on Apple silicon;
- iOS 17 or newer;
- network access to the lab-hosted pages for the interactive scenarios.

Open `lab.ios.WebView.xcodeproj` and run the `lab.ios.WebView` scheme. The
XCTest target covers deterministic native behavior without depending on the
remote pages. Detailed exercise design and instructor notes are intentionally
kept out of this client repository.
