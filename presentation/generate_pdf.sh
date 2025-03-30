#!/bin/bash

# Check if Chrome is installed
if command -v chrome > /dev/null 2>&1; then
    CHROME_CMD="chrome"
elif command -v google-chrome > /dev/null 2>&1; then
    CHROME_CMD="google-chrome"
elif command -v chromium > /dev/null 2>&1; then
    CHROME_CMD="chromium"
elif [ -f "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" ]; then
    CHROME_CMD="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
else
    echo "Error: Chrome or Chromium not found. Please install it to generate the PDF."
    exit 1
fi

# Get the absolute path of the HTML files
PRESENTATION_HTML="$(pwd)/presentation/financial_advisor_presentation.html"
PRESENTATION_PDF="$(pwd)/presentation/financial_advisor_presentation.pdf"

STUDY_HTML="$(pwd)/presentation/comprehensive_study_document.html"
STUDY_PDF="$(pwd)/presentation/comprehensive_study_document.pdf"

echo "Generating Presentation PDF from HTML..."
"$CHROME_CMD" --headless --disable-gpu --print-to-pdf="$PRESENTATION_PDF" "$PRESENTATION_HTML"

if [ $? -eq 0 ]; then
    echo "Presentation PDF successfully generated at: $PRESENTATION_PDF"
else
    echo "Error generating Presentation PDF"
fi

echo "Generating Comprehensive Study Document PDF from HTML..."
"$CHROME_CMD" --headless --disable-gpu --print-to-pdf="$STUDY_PDF" "$STUDY_HTML"

if [ $? -eq 0 ]; then
    echo "Comprehensive Study Document PDF successfully generated at: $STUDY_PDF"
else
    echo "Error generating Comprehensive Study Document PDF"
fi 