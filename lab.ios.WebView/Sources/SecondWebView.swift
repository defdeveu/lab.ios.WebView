import SwiftUI
import WebKit

struct SecondWebView: View {
    private let viewModel: SecondWebViewModel = SecondWebViewModel()

    var body: some View {
        WebView_WK(navigationDelegate: viewModel,
                   messageHandler: viewModel,
                   url: URL(string: SecondWebViewModel.defaultURLString)!)
    }
}

struct WebView_WK: UIViewRepresentable {

    weak var navigationDelegate: WKNavigationDelegate?
    let messageHandler: WKScriptMessageHandlerWithReply
    var url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = navigationDelegate
        webView.configuration.preferences.isFraudulentWebsiteWarningEnabled = false
        webView.configuration.preferences.javaScriptCanOpenWindowsAutomatically = true
        webView.configuration.preferences.setValue(true, forKey: "allowFileAccessFromFileURLs")
        webView.configuration.userContentController.addScriptMessageHandler(messageHandler, contentWorld: .page, name: SecondWebViewModel.messageHandleName)
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
