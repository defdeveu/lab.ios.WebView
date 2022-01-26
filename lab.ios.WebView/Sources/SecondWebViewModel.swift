import Foundation
import WebKit

class SecondWebViewModel: NSObject {
    static let messageHandleName = "SystemAPI"
    static let defaultURLString = "https://zs.labs.defdev.eu/forums.html"
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

extension SecondWebViewModel: WKScriptMessageHandlerWithReply {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage, replyHandler: @escaping (Any?, String?) -> Void) {
        if message.name == Self.messageHandleName {
            guard let dictionary = message.body as? [String: AnyObject],
                  let command = dictionary["command"] as? String,
                  let parameter = dictionary["parameter"] as? String else {
                      return
                  }
            switch command {
            case "loadFile":
                print("Loading file \(parameter)")
                replyHandler("Some file content", nil)
            case "loadContact":
                print("Getting contact of \(parameter)")
                replyHandler("+123456789", nil)
            default:
                print("Command not recognized")
                replyHandler(nil, "unrecognized command, sorry")
            }
        } else {
            replyHandler(nil, "undefined command")
        }
    }
}
