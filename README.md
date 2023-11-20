# Poppler

A Swift interface to the Poppler library.

Right now the functionality is quite limited.

    import SwiftPoppler
    
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
