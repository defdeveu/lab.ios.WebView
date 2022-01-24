import Foundation
import WebKit

class SecondWebViewModel: NSObject {
    static let defaultURLString = "https://zs.labs.defdev.eu/eula.html"
    private let urlOpener: URLOpenerProtocol

    init(urlOpener: URLOpenerProtocol = AppRepository.shared.urlOpener) {
        self.urlOpener = urlOpener
    }
}

extension SecondWebViewModel: WKNavigationDelegate {
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationAction: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        guard let url = navigationAction.request.url, url.absoluteString != Self.defaultURLString else {
            decisionHandler(.allow)
            return
        }

        decisionHandler(.cancel)
        urlOpener.open(url)
    }
}
