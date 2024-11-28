# Archery-Scoresheet-OCR
Accelerate score calculation process with AI

Performance: TBA

## Installation Instruction:

1. [Downloading necessary files](#download-the-following-files-to-same-folder-location)

2. [Installing libraries](#click-to-install-required-libraries)

3. [Run OCR](#click-to-run-ocr)

4. [OCR required documents](#what-to-upload)

5. [Expected results](#results)


# Steps to install
## 1. Download the following files to same folder location
Download ResNet weighting from
```
https://drive.google.com/file/d/1Hp74gLrOdXNIRWB_PxiqBxdl7QsSaKYi/view?usp=sharing
```
#### For Windows
- install_packages_bat.cpython-312.pyc
- install_packages_windows.bat
- ocr.cpython-312.pyc
- run_ocr_windows.bat
- requirements.txt
- resnet.pt (from Google Drive above)

#### For Linux/MacOS
- install_packages_bat.cpython-312.pyc
- install_packages_LinuxMac.sh
- ocr.cpython-312.pyc
- run_ocr_LinuxMac.sh
- requirements.txt
- resnet.pt (from Google Drive above)

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
The User Interface is shown below. Other than ***Scanned Scoresheet***, uploads are optional.
![OCR Interface](template/ocr_interface.png?raw=true "OCR Interface")

#### A. Scanned Scoresheet
The scanned scoresheet must be in .pdf format and the design of the grids should be similar. Multiple pages are allowed in the same PDF file. However, the order of scanning must be identical to the order participants are listed in Namelist (if any).
![Scoresheet template](template/scoresheet_template.jpg?raw=true "Scoresheet template")

#### B. Namelist
The namelist must be in .xlsx format and consists of only 1 worksheet. It must have 4 columns:
- Target
- Name
- HKAA number
- Club

![Namelist template](template/namelist_template.png?raw=true "Namelist template")

#### C. Round 1 Score
Round 1 Score must be in .xlsx format. Just use the excel generated from round 1. If you insist on forging a round 1 scoresheet, the key point is including a worksheet 'Summary' (as shown in Results). A possible thing that might cause hiccups is that if you haven't opened the excel before, the formulae would not have calculated the scores, so the numbers would appear to be 0 in the new, round 2 score. So just open it.

#### D. Destination
Folder where you want the output excel to be put.

## 4. Press Proceed
A green bar would run on the bottom of the pop-up window to show OCR progress. Once the bar finishes running, another pop-up window would tell you the recognition is done. Do not open the excel before this pop-up as the writing access might be restricted.

Once the pop-up is closed, it will close the application as well.

## 5. Results
Most cells in the generated excel are not editable to prevent messing up with the formulae. If you wish to edit something, please copy and paste to another excel.
#### A. Ranking
All archers ranked by score from highest to lowest. If 2 or more archers have the same score, their rankings are determined by Total 10+X then Total X. If you still see any archers having 2 or more places in Ranking, it would mean other people having same Total 10+X and Total X as them as well. Ask judge what to do.
![Ranking template](template/Ranking.png?raw=true "Ranking template")
#### B. Summary
All archers listed according to their target number, not sorted. This worksheet is essential for any 2nd round score calculations.
![Summary template](template/round1score_template.png?raw=true "Summary template")
### C. Individual Scoresheets
The small scores are editable, the subtotals, totals, count of 10+X, and count of X will change accordingly.
![Individual scoresheets template](template/output_scoresheet.png?raw=true "Individual scoresheets template")
