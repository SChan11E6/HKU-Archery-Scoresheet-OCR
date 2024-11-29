# Archery-Scoresheet-OCR
Accelerate score calculation process with AI

## Performance: 

### Accuracy:
Sample:

Target Face: 6-Ring

Total 26 targets * 4 person per target = 104 scoresheets, 3744 cells to fill.

6 scoresheets are empty (archer absent), so actually 98 scoresheets, 3528 cells.

- Scoresheets that cannot be recognized: 2
- Wrongly classified cells (excluding scoresheets that cannot be recognized): 658 > Accuracy: 81.35%
- Wrongly classified cells after excluding impossible digits 1, 2, 3, 4(excluding scoresheets that cannot be recognized): 528 > Accuracy: 85.03%


### Speed:

Hand Calculate: 53:10.83 / 26 * 4 archers = 30.681s per individual scoresheet

OCR Calculate: (0:36.60 (generate excel time) + 42:52.02 (manual checking)) / 26 * 4 archers = 25.083s per individual scoresheet

Remarks: 
- In reality, the 4 groups in each session (male and female, novice & beginner / intermediate & advance) would be calculated separately, so the OCR average time would be 6.27s per archer, which is roughly the same speed as hand calculating with 5 helpers.
- The time of hand calculating each individual scoresheet is relatively constant. Whereas for OCR it deviates significantly between perfectly recognized scoresheets and those that cannot be recognized. Main reason of long calculating time for poorly recognized scoresheets is the need to punch in each individual number cuz the subtotal cells are locked.
- Extending from the previous remark, the speed of calculation should increase slightly after applying exclusion of impossible digits.

## Installation Instruction:

1. [Downloading necessary files](#1-download-the-following-files-to-same-folder-location)

2. [Installing libraries](#2-click-to-install-required-libraries)

3. [Run OCR](#3-click-to-run-ocr)

4. [OCR required documents](#4-what-to-upload)

5. [Expected results](#5-results)


# Steps to install
## 1. Download the following files to same folder location
Download ResNet weighting from
```
https://drive.google.com/file/d/1Hp74gLrOdXNIRWB_PxiqBxdl7QsSaKYi/view?usp=sharing
```
_P.S. If you trained another better model, rename it to <ins>**resnet.pt**</ins> for use in this application. Just make sure the input of your model is consistent with 28 x 28 fed in images._

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
The User Interface is shown below. Other than ***Scanned Scoresheet***, uploads are optional. If you just want an empty spreadsheet that does the ranking automatically, upload corresponding number of empty scoresheets and just input subtotals or totals into the cells designated for individual score, there is no limit to what number can be inputted.


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

#### E. Excluded digits
Some target faces such as WA 6 RIng does not have the digits 1 to 4. By clicking on the corresponding digits to exclude them in the prediction, the accuracy could be increased. Excluded digits are shown in red, while the ones used are green.

## 4. Press Proceed
A green bar would run on the bottom of the pop-up window to show OCR progress. Once the bar finishes running, the window will close itself, signifying the process has been completed. Do not open the excel when the progress bar is going, as the writing access might be restricted.

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
