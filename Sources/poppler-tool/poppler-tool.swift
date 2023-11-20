import Foundation
import SwiftPoppler
import ArgumentParser

@main
struct SwiftArgumentParserMwe: ParsableCommand {
    @Argument(help: "Path to PDF file")
    var pdfFile: String

    mutating func run() throws {
        print("Poppler version: \(LibraryInfo.version)")
        print("Major version: \(LibraryInfo.Version.major)")
        print("Minor version: \(LibraryInfo.Version.minor)")
        print("Micro version: \(LibraryInfo.Version.micro)")

        do {
            let pdfURL = URL(filePath: pdfFile)
            let pdfDocument = try Document(url: pdfURL)
            print("The number of pages in '\(pdfURL.lastPathComponent)' is \(pdfDocument.count).")
            _ = pdfDocument.embeddedFiles.map { print("Size of file: \($0.size)") }
        } catch {
            print(error.localizedDescription)
        }
    }
}
