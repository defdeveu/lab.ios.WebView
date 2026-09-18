import Foundation
import UIKit

@MainActor
protocol URLOpenerProtocol: AnyObject {
    func open(_ url: URL)
}

@MainActor
final class URLOpener: URLOpenerProtocol {
    func open(_ url: URL) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
