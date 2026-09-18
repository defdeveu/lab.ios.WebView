import SwiftUI

@main
struct WebViewLabApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
            }
            .tint(AppColors.navigationForeground)
        }
    }
}
