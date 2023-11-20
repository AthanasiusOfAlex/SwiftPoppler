#ifndef document_h
#define document_h

#include <cpp/poppler-document.h>

/// Gets a pointer to a PDF document.
/// Note: if the document fails to load, the pointer will be null.
void* getPDFDocument(const char* filename) {
    return poppler::document::load_from_file(filename);
}

/// Deletes the PDF document.
/// Note: it is the responsibility of the user to ensure that the pointer is not already free.
/// Placing this in the destructor should be fine.
void deletePDFDocument(void* document) {
    delete (poppler::document *)document;
}

/// Get the number of pages.
/// Note that it is the responsibility of the user to ensure that the pointer is not null.
int getNumberOfPages(void* document) {
    auto popplerDocument = (poppler::document *)document;
    return popplerDocument->pages();
}

#endif /* document_h */
