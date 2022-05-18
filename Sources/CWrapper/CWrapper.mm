//
//  CWrapper.mm
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

#import <iostream>
#import <stdlib.h>
#import "CWrapper.h"

@import CxxLibrary;

using namespace std;

const char* getVersionString() {
    auto versionString = poppler::version_string();
    auto bufferSize = versionString.size() + 1;
    auto buffer = (char *)malloc(bufferSize);
    strcpy(buffer, versionString.c_str());
    return buffer;
}

void deleteVersionString(const char* versionString) {
    free((void *)versionString);
}


void* getPdfDocument(const char* filename) {
    return poppler::document::load_from_file(filename);
}

void deletePdfDocument(void* document) {
    delete (poppler::document *)document;
}

/// Get the number of pages. Note that it is the
/// responsibility of the user to ensure that the
/// pointer is not null.
int getNumberOfPages(void* document) {
    assert(document != nullptr);
    auto popplerDocument = (poppler::document *)document;
    return popplerDocument->pages();
}
