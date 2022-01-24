import Foundation
import UIKit

protocol URLOpenerProtocol {
    func open(_ url: URL)
}

class URLOpener: URLOpenerProtocol {
    func open(_ url: URL) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
