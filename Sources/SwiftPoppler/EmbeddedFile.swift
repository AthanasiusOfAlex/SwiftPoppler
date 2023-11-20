import Foundation
import CxxPoppler

/// Represents a file embedded in a PDF document.
public class EmbeddedFile {
    private var _embeddedFilePointer: UnsafeMutableRawPointer
    
    init(_ embeddedFilePointer: UnsafeMutableRawPointer!) {
        _embeddedFilePointer = embeddedFilePointer
    }
    
    public var size: Int { Int(getEmbeddedFileSize(_embeddedFilePointer)) }
}
