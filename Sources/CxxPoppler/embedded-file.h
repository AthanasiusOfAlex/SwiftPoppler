#ifndef embedded-file_h
#define embedded-file_h

#include <vector>
#include <cpp/poppler-document.h>
#include <cpp/poppler-embedded-file.h>

/// Gets a pointer to a PDF document.
/// Note: it is the responsibility of the user to ensure that the document is valid (not null).
std::vector<void *> getEmbeddedFilesList(void * pdfDocument) {
    auto document = static_cast<poppler::document*>(pdfDocument);
    std::vector<poppler::embedded_file *>fileList = document->embedded_files();
    auto fileListForExport = std::vector<void *>();

    for (auto file : fileList) {
        fileListForExport.push_back(file);
    }
    
    return fileListForExport;
}

int getEmbeddedFileSize(void * embeddedFile) {
    auto file = static_cast<poppler::embedded_file *>(embeddedFile);
    return file->size();
}

#endif /* embedded-file_h */
