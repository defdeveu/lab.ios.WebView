import Foundation
import SwiftUI
import WebKit

struct SecondWebView: View {
    static let pageURL = URL(string: "https://zs.labs.defdev.eu/eula.html")!

    var body: some View {
        WebView_WK(url: Self.pageURL)
    }
}

struct WebView_WK: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.load(URLRequest(url: url))
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        guard webView.url != url else { return }
        webView.load(URLRequest(url: url))
    }
}
