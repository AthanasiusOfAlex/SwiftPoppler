//
//  File.swift
//  
//
//  Created by Louis Melahn on 11/20/23.
//

import Foundation

public func throwError() throws {
    throw CocoaError.error(.featureUnsupported)
}
