import Foundation
import SwiftPoppler
import ArgumentParser

enum MainError: Error {
    case badPDFFile(url: URL)
}

extension MainError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .badPDFFile(url: let url):
            "The PDF file '\(url.lastPathComponent)' could not be read."
        }
    }
}

@main
struct SwiftArgumentParserMwe: ParsableCommand {
    @Argument(help: "Path to PDF file")
    var pdfFile: String

    mutating func run() throws {
        print("Poppler version: \(LibraryInfo.version)")
        print("Major version: \(LibraryInfo.Version.major)")
        print("Minor version: \(LibraryInfo.Version.minor)")
        print("Micro version: \(LibraryInfo.Version.micro)")

        let pdfURL = URL(filePath: pdfFile)
        
        guard let pdfDocument = Document(URL: pdfURL) else { throw MainError.badPDFFile(url: pdfURL) }
        
        print("The number of pages in '\(pdfURL.lastPathComponent)' is \(pdfDocument.count).")
        
        _ = pdfDocument.embeddedFiles.map { print("Size of file: \($0.size)") }
    }
}
