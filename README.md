# Archery-Scoresheet-OCR
Accelerate score calculation process with AI

# Steps to install
## 1. Download the following files to same folder location
#### For Windows
- install_packages_bat.cpython-312.pyc
- install_packages_windows.bat
- ocr.cpython-312.pyc
- run_ocr_windows.bat
- requirements.txt
- resnet.pt

#### For Linux/MacOS
- install_packages_bat.cpython-312.pyc
- install_packages_LinuxMac.sh
- ocr.cpython-312.pyc
- run_ocr_LinuxMac.sh
- requirements.txt
- resnet.pt

## 2. Click to install required libraries
#### For Windows: 
> install_package_windows.bat

#### For Linux/MacOS: 
> install_packages_LinuxMac.sh

Download interface, click Download.
![Download Interface](template/download_package.png?raw=true "Download Interface")

What it looks like when downloading, might take a while.
![Downloading](template/downloading_package.png?raw=true "Downloading")

Finished downloading. Click Close to end application
![Finish Download](template/done_package.png?raw=true "Finish Download")

## 3. Click to Run OCR
#### For Windows
> run_ocr_windows.bat

#### For Linux/MacOS
> run_ocr_LinuxMac.sh

First time starting it might take longer than usual as the model need to be loaded. Don't worry if the nothing seems to be happening. The window would pop up after at most 1 minute.

## 4. What to upload
The User Interface is shown below. Other than ***Scanned Scoresheet***, all other files are optional.
![OCR Interface](template/ocr_interface.png?raw=true "OCR Interface")

#### Scanned Scoresheet
The scanned scoresheet must be in .pdf format and the design of the grids should be similar. Multiple pages are allowed in the same PDF file. However, the order of scanning must be identical to the order participants are listed in Namelist (if any).
![Scoresheet template](template/scoresheet_template.jpg?raw=true "Scoresheet template")

#### Namelist
The namelist must be in .xlsx format and consists of only 1 worksheet. It must have 4 columns:
- Target
- Name
- HKAA number
- Club
![Namelist template](template/namelist_template.jpg?raw=true "Namelist template")
