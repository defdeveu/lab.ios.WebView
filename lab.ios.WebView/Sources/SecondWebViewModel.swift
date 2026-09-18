import Foundation
import WebKit

@MainActor
final class SecondWebViewModel: NSObject {
    static let defaultURL = URL(string: "https://zs.labs.defdev.eu/eula.html")!
    private let urlOpener: any URLOpenerProtocol

    init(urlOpener: any URLOpenerProtocol = AppRepository.shared.urlOpener) {
        self.urlOpener = urlOpener
    }

    func navigationPolicy(for url: URL?) -> WKNavigationActionPolicy {
        guard let url, url != Self.defaultURL else {
            return .allow
        }

        urlOpener.open(url)
        return .cancel
    }
}

extension SecondWebViewModel: WKNavigationDelegate {
    func webView(
        _ webView: WKWebView,
        decidePolicyFor navigationAction: WKNavigationAction
    ) async -> WKNavigationActionPolicy {
        navigationPolicy(for: navigationAction.request.url)
    }
}
