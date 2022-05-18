//
//  CWrapper.h
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

#ifndef CWrapper_h
#define CWrapper_h

#ifdef __cplusplus
extern "C"  {
#endif

/// Returns a pointer to a C string with the current version
/// of Poppler.
///
/// Note that it is the responsibility of the user to delete the
/// string afterwards using deleteVersionString(), since this
/// wrapper does no memory management. It should not be
/// null, so you may force-unwrap it.

const char* getVersionString();

/// Deletes the version string once it is no longer needed.
void deleteVersionString(const char* versionString);

/// Creates a PDF document object
///
/// Note that it is the user’s responsibility to delete it.
/// It could be null, so check for a null pointer.
void* getPdfDocument(const char* filename);

/// Delete a PDF document object. Check for null pointer.
void deletePdfDocument(void* document);

int getNumberOfPages(void* document);

#ifdef __cplusplus
}
#endif

#endif /* CWrapper_h */
