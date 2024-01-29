#!/bin/bash

# Script for combining videos using ffmpeg

# Check if a directory argument is provided
if [ -z "$1" ]; then
  echo -n "Enter the path to the video directory (or press Enter to use the current directory): "
  read -r video_directory
  video_directory=${video_directory:-.}  # Default to current directory if input is empty
else
  video_directory="$1"
fi

# Specify the output file with a timestamp
timestamp=$(date +"%Y%m%d_%H%M%S")
output_file="output_${timestamp}.mp4"

# Check if output file already exists, and if so, ignore
if [ -e "$output_file" ]; then
  echo "Error: Output file already exists. Aborting script."
  exit 1
fi

# Change to the specified video directory
cd "$video_directory" || exit

# Generate filelist.txt excluding empty files
find . -type f -iname "*.mp4" -size +0c -printf "file '%f'\n" > filelist.txt

# Check if filelist.txt is empty
if [ -s filelist.txt ]; then
  # Combine videos using ffmpeg
  ffmpeg -f concat -safe 0 -i filelist.txt -c copy "$output_file" 2>/dev/null

  # Check for errors
  if [ $? -eq 0 ]; then
    echo "Video combination successful. Output: $output_file"
  else
    echo "Error: Video combination failed."
  fi
else
  echo "Error: No valid video files found in the specified directory."
fi
