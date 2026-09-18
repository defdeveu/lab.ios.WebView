import Foundation
import WebKit

@MainActor
final class SecondWebViewModel: NSObject {
    static let messageHandlerName = "SystemAPI"
    static let defaultURL = URL(string: "https://zs.labs.defdev.eu/forums.html")!
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

extension SecondWebViewModel: WKScriptMessageHandlerWithReply {
    func userContentController(
        _ userContentController: WKUserContentController,
        didReceive message: WKScriptMessage
    ) async -> (Any?, String?) {
        guard message.name == Self.messageHandlerName else {
            return (nil, "undefined command")
        }
        guard let dictionary = message.body as? [String: Any],
              let command = dictionary["command"] as? String,
              let parameter = dictionary["parameter"] as? String else {
            return (nil, "invalid command")
        }

        switch command {
        case "loadFile":
            print("Loading file \(parameter)")
            return ("Some file content", nil)
        case "loadContact":
            print("Getting contact of \(parameter)")
            return ("+123456789", nil)
        default:
            print("Command not recognized")
            return (nil, "unrecognized command, sorry")
        }
    }
}
