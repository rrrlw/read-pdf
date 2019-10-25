## read-pdf: Convert PDF of scanned text into TXT format
Raoul R. Wadhwa, Marvin R. Natowicz

Cleveland Clinic Lerner College of Medicine

Case Western Reserve University

---------------------------

### Purpose

Working with large PDF documents composed of scanned pages of text documents can be daunting, even for simple tasks such as searching for a word (Ctrl+F doesn't work!).
`read-pdf` uses `qpdf`, ImageMagick, and Tesseract OCR to do all the heavy lifting (in fact, `read-pdf` is just a short wrapper of these tools).

### Requirements

* `qpdf`
* ImageMagick
* Tesseract OCR

### Use

1. Create a directory that satisfies the following requirements:
    * contains `read-pdf.sh`
    * contains the PDF file you would like to convert to TXT format
    * does not contain a directory named `temp` (used to extract and process individual pages)
2. Using Terminal, `cd` into this directory and run the following, where `Input.pdf` should be replaced by name of the PDF you would like to convert, `10` should be replaced by the number of pages in `Input.pdf`, and `Output.txt` should be replaced by the desired name of the file that will contain the converted PDF in TXT format:
```
./read-pdf.sh Input.pdf 10 Output.txt
```

### Example

The following code can be directly run on Terminal to convert the first 5 pages of the `TestRecord.pdf` sample file included on `read-pdf`'s [GitHub repo] to TXT format. Note: the code will not run correctly unless you have all of the listed requirements installed.
```
git clone https://github.com/rrrlw/read-pdf.git
cd read-pdf
./read-pdf.sh TestRecord.pdf 5 output.txt
```

### Contribute

To contribute to this repository, please fork it and submit a pull request with modifications.
For ease of review, please also include what you changed and why.