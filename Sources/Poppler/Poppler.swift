//
//  Poppler.swift
//  PopplerMwe
//
//  Created by Athanasius of Alexandria on 5/17/22.
//
//  MIT License
//
//  Copyright (c) 2022 Athanasius of Alexandria
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import Foundation
import CWrapper

/// Returns a string with the current version of Poppler.
public func getVersionString() -> String {
    let cString = CWrapper.getVersionString()!
    
    defer {
        deleteVersionString(cString)
    }
    
    return String(cString: cString)
}

/// Represents a PDF document.
///
/// A PDF document can be opened by calling the
/// initializer and providing the path to a PDF file.
/// The initializer is fallible and will produce `nil` if the file
/// does not exist or is invalid.
///
///     if let document = Document(fileName: "foo.pdf") {
///         print(document.pages)
///     } else {
///         print("PDF was missing or invalid")
///     }
public class Document {
    private var documentPtr: UnsafeMutableRawPointer
    public var pages: Int {
        let number = getNumberOfPages(documentPtr)
        assert(number >= 0)
        return Int(number)
    }
    
    public init?(fileName: String) {
        guard let pointer = getPdfDocument(fileName) else {
            return nil
        }
        documentPtr = pointer
    }
    
    public convenience init?(file: URL) {
        self.init(fileName: file.path)
    }
    
    deinit {
        deletePdfDocument(documentPtr)
    }
}
