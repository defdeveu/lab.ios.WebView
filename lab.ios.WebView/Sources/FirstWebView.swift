import SwiftUI
import WebKit

struct FirstWebView: View {
    var body: some View {
        WebView_UI(url: URL(string: "https://www.google.com")!)
    }
}

struct WebView_UI: UIViewRepresentable {

    var url: URL

    func makeUIView(context: Context) -> UIWebView {
        return UIWebView()
    }

    func updateUIView(_ webView: UIWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.loadRequest(request)
    }
}
