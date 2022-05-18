# Poppler

A Swift interface to the Poppler library.

Right now the _only_ thing it does is return the version number
and the number of pages of a PDF file.

    let version = getVersionString()  // 22.05.0

    if let document = Document(fileName: "foo.pdf") {
        print(document.pages)
    } else {
        print("PDF was missing or invalid")
    }
