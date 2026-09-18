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
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        webView.load(URLRequest(url: url))
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        guard webView.url != url else { return }
        webView.load(URLRequest(url: url))
    }

    static func dismantleUIView(_ webView: WKWebView, coordinator: SecondWebViewModel) {
        webView.navigationDelegate = nil
    }
}
