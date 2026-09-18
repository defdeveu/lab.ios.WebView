import Foundation

// MARK: - Application Services

@MainActor
final class AppRepository {
    static let shared = AppRepository()

    let urlOpener: any URLOpenerProtocol

    init(urlOpener: any URLOpenerProtocol = URLOpener()) {
        self.urlOpener = urlOpener
    }
}
