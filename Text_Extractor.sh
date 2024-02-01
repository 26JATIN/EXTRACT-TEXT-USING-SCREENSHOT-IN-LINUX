#!/bin/bash

# Function to perform OCR using Tesseract and copy text to clipboard
perform_ocr() {
    local img_path="$1"

    # Perform OCR using Tesseract
    result=$(tesseract "$img_path" stdout)

    # Copy text to clipboard
    echo -n "$result" | xclip -selection clipboard
    echo "Recognized Text: $result (copied to clipboard)"
}

# Capture screenshot of a selected area using gnome-screenshot on Linux
screenshot_file="/tmp/screenshot.png"
gnome-screenshot --area --file="$screenshot_file"

# Check if the screenshot file was successfully created
if [ -f "$screenshot_file" ]; then
    # Perform OCR on the captured screenshot and copy text to clipboard
    perform_ocr "$screenshot_file"

    # Clean up: Remove the temporary screenshot file
    rm "$screenshot_file"
else
    echo "Error: Unable to capture screenshot."
fi

