import SwiftUI
import WebKit

struct FirstWebView: View {
    var body: some View {
        WebView_UI(url: URL(string: "https://zs.labs.defdev.eu/eula.html")!)
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
