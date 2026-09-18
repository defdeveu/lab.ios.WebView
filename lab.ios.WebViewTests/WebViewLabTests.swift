import Foundation
import WebKit
import XCTest
@testable import lab_ios_WebView

@MainActor
final class SecondWebViewModelTests: XCTestCase {
    func testAllowsTheConfiguredPageWithoutOpeningAnotherApplication() {
        let opener = RecordingURLOpener()
        let viewModel = SecondWebViewModel(urlOpener: opener)

        let policy = viewModel.navigationPolicy(for: SecondWebViewModel.defaultURL)

        XCTAssertEqual(policy, .allow)
        XCTAssertTrue(opener.openedURLs.isEmpty)
    }

    func testCancelsAnotherURLAndHandsItToTheSystem() {
        let opener = RecordingURLOpener()
        let viewModel = SecondWebViewModel(urlOpener: opener)
        let externalURL = URL(string: "https://example.com/next")!

        let policy = viewModel.navigationPolicy(for: externalURL)

        XCTAssertEqual(policy, .cancel)
        XCTAssertEqual(opener.openedURLs, [externalURL])
    }

    func testAllowsNavigationWithoutAURL() {
        let opener = RecordingURLOpener()
        let viewModel = SecondWebViewModel(urlOpener: opener)

        XCTAssertEqual(viewModel.navigationPolicy(for: nil), .allow)
        XCTAssertTrue(opener.openedURLs.isEmpty)
    }
}

@MainActor
private final class RecordingURLOpener: URLOpenerProtocol {
    private(set) var openedURLs: [URL] = []

    func open(_ url: URL) {
        openedURLs.append(url)
    }
}
