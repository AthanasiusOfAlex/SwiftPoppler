import Foundation
import CxxPoppler

/// Represents a PDF document.
///
/// A PDF document can be opened by calling the
/// initializer and providing the path to a PDF file.
/// The initializer is fallible and will produce `nil` if the file
/// does not exist or is invalid.
///
///     if let document = Document(filePath: "foo.pdf") {
///         print(document.pages)
///     } else {
///         print("PDF was missing or invalid")
///     }
///
/// - Initializers:
public class Document {
    private var _documentPointer: UnsafeMutableRawPointer
    private var _listOfFilePointers: [UnsafeMutableRawPointer?]
    
    /// Creates a new Document object based on the given path.
    ///
    /// Throws `SwiftPopplerError.badPDFFile` if the file is not found or cannot be read.
    ///
    /// - Parameter URL: the URL to the PDF file
    public init (url: URL) throws {
        guard let documentPointer = getPDFDocument(url.path()) else {
            throw SwiftPopplerError.badPDFFile(url: url)
        }
        _documentPointer = documentPointer
        _listOfFilePointers = Array<UnsafeMutableRawPointer?>(getEmbeddedFilesList(_documentPointer))
    }
    
    deinit {
        deletePDFDocument(_documentPointer)
    }
    
// MARK - Properties
    
    /// The number of pages in the document
    public var count: Int {
        return Int(getNumberOfPages(_documentPointer))
    }
    
    /// An array representing any files embedded in the document. The array is empty if there are none.
    public var embeddedFiles: [EmbeddedFile] { _listOfFilePointers.map { EmbeddedFile($0) } }
}

extension Document {
    /// Creates a new Document object based on the given URL.
    ///
    /// Throws `SwiftPopplerError.badPDFFile` if the file is not found or cannot be read.
    ///
    /// - Parameter filePath: the path to the PDF file
    public convenience init? (filePath: String) throws {
        try self.init(url: URL(filePath: filePath))
    }
}
