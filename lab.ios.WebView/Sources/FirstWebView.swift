import Foundation
import SwiftUI
import WebKit

struct FirstWebView: View {
    static let pageURL = URL(string: "https://www.google.com")!

    var body: some View {
        WebView_UI(url: Self.pageURL)
    }
}

struct WebView_UI: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> UIWebView {
        UIWebView()
    }

    func updateUIView(_ webView: UIWebView, context: Context) {
        guard webView.request?.url != url else { return }
        webView.loadRequest(URLRequest(url: url))
    }
}
