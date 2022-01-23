import SwiftUI
import WebKit

struct SecondWebView: View {
    var body: some View {
        WebView_WK(url: URL(string: "https://www.google.com")!)
    }
}

struct WebView_WK: UIViewRepresentable {

    var url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
