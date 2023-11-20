import Foundation

public enum SwiftPopplerError: Error {
    case badPDFFile(url: URL)
}

extension SwiftPopplerError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .badPDFFile(url: let url):
            "The PDF file '\(url.lastPathComponent)' could not be read."
        }
    }
}
