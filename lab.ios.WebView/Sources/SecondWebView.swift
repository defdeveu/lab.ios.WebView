import Foundation
import SwiftUI
import WebKit

struct SecondWebView: View {
    var body: some View {
        WebView_WK(url: SecondWebViewModel.defaultURL)
    }
}

struct WebView_WK: UIViewRepresentable {
    let url: URL

    func makeCoordinator() -> SecondWebViewModel {
        SecondWebViewModel()
    }

    func makeUIView(context: Context) -> WKWebView {
        let configuration = WKWebViewConfiguration()
        configuration.preferences.isFraudulentWebsiteWarningEnabled = false
        configuration.preferences.javaScriptCanOpenWindowsAutomatically = true
        configuration.preferences.setValue(true, forKey: "allowFileAccessFromFileURLs")
        configuration.userContentController.addScriptMessageHandler(
            context.coordinator,
            contentWorld: .page,
            name: SecondWebViewModel.messageHandlerName
        )

        let webView = WKWebView(frame: .zero, configuration: configuration)
        webView.navigationDelegate = context.coordinator
        webView.load(URLRequest(url: url))
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        guard webView.url != url else { return }
        webView.load(URLRequest(url: url))
    }

    static func dismantleUIView(_ webView: WKWebView, coordinator: SecondWebViewModel) {
        webView.configuration.userContentController.removeScriptMessageHandler(
            forName: SecondWebViewModel.messageHandlerName,
            contentWorld: .page
        )
        webView.navigationDelegate = nil
    }
}
