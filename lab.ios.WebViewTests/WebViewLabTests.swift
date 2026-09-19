import Foundation
import WebKit
import Testing
@testable import lab_ios_WebView

@MainActor
@Suite
struct SecondWebViewModelTests {
    @Test
    func allowsTheConfiguredPageWithoutOpeningAnotherApplication() {
        let opener = RecordingURLOpener()
        let viewModel = SecondWebViewModel(urlOpener: opener)

        let policy = viewModel.navigationPolicy(for: SecondWebViewModel.defaultURL)

        #expect(policy == .allow)
        #expect(opener.openedURLs.isEmpty)
    }

    @Test
    func cancelsAnotherURLAndHandsItToTheSystem() {
        let opener = RecordingURLOpener()
        let viewModel = SecondWebViewModel(urlOpener: opener)
        let externalURL = URL(string: "https://example.com/next")!

        let policy = viewModel.navigationPolicy(for: externalURL)

        #expect(policy == .cancel)
        #expect(opener.openedURLs == [externalURL])
    }

    @Test
    func allowsNavigationWithoutAURL() {
        let opener = RecordingURLOpener()
        let viewModel = SecondWebViewModel(urlOpener: opener)

        #expect(viewModel.navigationPolicy(for: nil) == .allow)
        #expect(opener.openedURLs.isEmpty)
    }
}

@MainActor
private final class RecordingURLOpener: URLOpenerProtocol {
    private(set) var openedURLs: [URL] = []

    func open(_ url: URL) {
        openedURLs.append(url)
    }
}