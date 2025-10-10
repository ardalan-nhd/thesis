#!/bin/bash

echo "Starting LaTeX compilation..."
echo "=============================="

# First run xelatex
echo "1. Running XeLaTeX (first pass)..."
xelatex AUTthesis.tex
if [ $? -ne 0 ]; then
    echo "Error: XeLaTeX failed on first pass!"
    exit 1
fi

# Run bibtex
echo "2. Running BibTeX..."
bibtex AUTthesis.aux
if [ $? -ne 0 ]; then
    echo "Error: BibTeX failed!"
    exit 1
fi

# Second run xelatex
echo "3. Running XeLaTeX (second pass)..."
xelatex AUTthesis.tex
if [ $? -ne 0 ]; then
    echo "Error: XeLaTeX failed on second pass!"
    exit 1
fi

# Third run xelatex
echo "4. Running XeLaTeX (final pass)..."
xelatex AUTthesis.tex
if [ $? -ne 0 ]; then
    echo "Error: XeLaTeX failed on final pass!"
    exit 1
fi

echo "=============================="
echo "Compilation completed successfully!"
echo "Output: AUTthesis.pdf"