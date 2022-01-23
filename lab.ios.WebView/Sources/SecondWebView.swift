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
        let webView = WKWebView()
        webView.configuration.preferences.isFraudulentWebsiteWarningEnabled = false
        webView.configuration.preferences.javaScriptCanOpenWindowsAutomatically = true
        webView.configuration.preferences.setValue(true, forKey: "allowFileAccessFromFileURLs")
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
