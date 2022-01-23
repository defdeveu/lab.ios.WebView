import SwiftUI

// MARK: - Colors

enum AppColors {
    // TODO color scheme dependency

    static let navigationBackground = Color(UIColor(named: "NavigationBkgdColor") ?? .black)
    static let navigationForeground = Color(UIColor(named: "NavigationFrgdColor") ?? .orange)
    static let buttonText = Color(UIColor(named: "ButtonTextColor") ?? .white)
}

// MARK: - Strings

enum AppStrings {
    static let appTitle = "WEBVIEW LAB"
}

// MARK: - Images

enum AppImages {
    static let navigationImage = UIImage(named: "bg-banner.ddd.2108.dark")
    static let appTitleImage = Image("logo.ddd.stamp.1905")
}
