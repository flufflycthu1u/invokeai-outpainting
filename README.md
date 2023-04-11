# Invokeai Outpainting
![winter-10-best](https://user-images.githubusercontent.com/2520037/228950826-a6350b17-ca87-4397-88ed-ebae45997f93.gif)

This project uses stable diffusion via the Invoke AI toolkit to outpaint images repeatedly.
It was developed using version 2.3.1.post2 of Invoke AI. More recent versions may work, but functionality is not guaranteed.

## Installation
1. Download and install [Invoke AI](https://github.com/invoke-ai/InvokeAI) from their [releases page](https://github.com/invoke-ai/InvokeAI/releases).
2. Make sure to download the stable-diffusion-1.5 and sd-inpainting-1.5 models.
3. Download and install this repository such that this readme.md is in the same folder as invoke.sh.
![image](https://user-images.githubusercontent.com/2520037/228951015-a1ee2994-0c4c-4a3b-a196-9f4da8ca197d.png)

## Usage
First place an image you want to expand in the inputs directory.

Next, to run this tool open a terminal in the root directory of the project and run `./prompts/from-pic.sh iterations filename`.
