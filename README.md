# Video Concatenation Script

This repository contains a Bash script for combining multiple video files into a single cohesive unit using `ffmpeg` on Linux. The script is designed to be simple, robust, and capable of handling various video sources.

## Getting Started

Follow these steps to use the video concatenation script:

### 1. Clone the Repository

Clone the repository to your local machine:

```bash
git clone https://github.com/byteshiva/video-concatenation-script.git
```

### 2. Enter the Development Environment (Optional)

If you're using Nix, you can enter the development environment to ensure consistent dependencies:

```bash
nix develop
```

### 3. Run the Script

Execute the `combine_videos.sh` script to concatenate your video files. Make sure to customize the script for your specific use case, specifying the correct output file:

```bash
bash ./combine_videos.sh
```

The script will generate a dynamic `filelist.txt`, exclude empty video files, and use `ffmpeg` to combine the videos into a single output file.

## License

This project is licensed under the [Apache-2.0-1](https://github.com/byteshiva/video-concatenation-script/tree/main?tab=Apache-2.0-1-ov-file).
