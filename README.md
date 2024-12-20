# Archery-Scoresheet-OCR
Accelerate score calculation process with AI
![Process](template/flow.png?raw=true "Process")

## Performance: 

Sample:

Total 26 targets * 4 person per target = 104 scoresheets, 3744 cells to fill.

6 scoresheets are empty (archer absent), so actually 98 scoresheets, **3528 cells**.

### Accuracy:

- Scoresheets that cannot be recognized: 2
- Wrongly classified cells (excluding scoresheets that cannot be recognized): 661 ==> **Accuracy: 80.87%**
- Wrongly classified cells after excluding impossible digits 1, 2, 3, 4(excluding scoresheets that cannot be recognized): 529 ==> **Accuracy: 84.69%**


### Speed:

Hand Calculate: 53:10.83 / 26 * 4 archers = **30.681s** per individual scoresheet

OCR Calculate:

- Generation: 0:36.60

- Manual Checking without exclusion: 42:52.02 / 26 * 4 archers = **24.731s** per individual scoresheet

- Manual Checking with exclusion: 37:32.46 / 26 * 4 archers = **21.658s** per individual scoresheet

Assuming the equation:

$$Checking\ time = Reading\ time * 3528 + correction\ time * num\ of\ wrong$$

Correction time is **2.421s**, and Reading time is **0.214s** per cell. 

Hence, we can infer a minimum of $0.214 \times 3528 = 756.226\ s$ or 12.6 min is needed to read through all cells.

### Summary:

- In reality, the 4 groups in each session (male and female, novice & beginner / intermediate & advance) would be calculated separately, so the program should be run on 4 devices, leading to an OCR average time of 6.27s per archer, which is roughly the same speed as hand calculating with 5 helpers.
- With exclusion, the accuracy is higher. Average OCR time of 5.50s per archer would equal having 6 helpers.
- The time of hand calculating each individual scoresheet is relatively constant. Whereas for OCR it deviates significantly between perfectly recognized scoresheets and those that cannot be recognized. Main reason of long calculating time for poorly recognized scoresheets is the need to punch in each individual number cuz the subtotal cells are locked.
- A faster way would be just checking rows that have a mismatch between predicted and written subtotals. However, accuracy might be impacted.
- If you just want an empty spreadsheet that does the ranking automatically, upload corresponding number of **empty scoresheets** and just input subtotals or totals into the cells designated for individual score, there is no limit to what number can be inputted.

## Installation Instruction:

Before any installation, please [check](#check-python-version) that your system has python 3.10.

1. [Downloading necessary files](#1-download-the-following-files-to-same-folder-location)

2. [Installing libraries](#2-install-required-libraries)

3. [Run OCR](#3-run-ocr)

4. [OCR required documents](#4-what-to-upload)

5. [Expected results](#5-results)
   
6. [Troubleshooting](#supplementary-information)


# Steps to install
## 1. Download the following files to same folder location

#### For Windows
- install_packages_bat.cpython-310.pyc
- install_packages_windows.bat
- ocr.cpython-310.pyc
- run_ocr_windows.bat
- requirements.txt
- resnet.pt (from Google Drive below)

#### For Linux/MacOS
- install_packages_bat.cpython-310.pyc
- install_packages_LinuxMac.sh
- ocr.cpython-310.pyc
- run_ocr_LinuxMac.sh
- requirements.txt
- resnet.pt (from Google Drive below)

Download ResNet weighting from
```
https://drive.google.com/file/d/1Hp74gLrOdXNIRWB_PxiqBxdl7QsSaKYi/view?usp=sharing
```
_P.S. If you trained another better model, rename it to <ins>**resnet.pt**</ins> for use in this application. Just make sure the input of your model is consistent with 28 x 28 fed in images, and output is an array of 12 logits for 0123456789mx respectively._

Learn more about how to create model from https://github.com/sejalgupta01/EMNIST-Classification/blob/master/EMNIST_Classification%20(3).ipynb

## 2. Install required libraries
This application would automatically open a virtual environment for installing all required packages and running the OCR application. This step only needs to be done the first time starting the application. From second time onwards, just go from step 3.
#### For Windows: 
double click
```
install_package_windows.bat
```

#### For Linux/MacOS: 
[Open Terminal in downloaded folder](#open-terminal-in-file-location) and run the following codes
```
chmod +x install_packages_LinuxMac.sh
./install_packages_LinuxMac.sh
```

Download interface, click Download.
![Download Interface](template/download_package.png?raw=true "Download Interface")

What it looks like when downloading, might take a while.


Finished downloading. Click Close to end application
![Finish Download](template/done_package.png?raw=true "Finish Download")

## 3. Run OCR
#### For Windows
double click
```
run_ocr_windows.bat
```

#### For Linux/MacOS
[Open Terminal in downloaded folder](#open-terminal-in-file-location) and run the following codes
```
chmod +x run_ocr_LinuxMac.sh
./run_ocr_LinuxMac.sh
```

First time starting, it might take longer than usual as the model need to be loaded. Don't worry if nothing seems to be happening. The window would pop up after at most 1 minute.

## 4. What to upload
The User Interface is shown below. Other than ***Scanned Scoresheet***, uploads are optional. 
![OCR Interface](template/ocr_interface.png?raw=true "OCR Interface")

#### A. Scanned Scoresheet
The scanned scoresheet must be in .pdf format and the design of the grids should be similar. Multiple pages are allowed in the same PDF file. However, the order of scanning must be identical to the order participants are listed in Namelist (if any).
![Scoresheet template](template/scoresheet_template.jpg?raw=true "Scoresheet template")

#### B. Namelist
The namelist must be in .xlsx format and consists of only 1 worksheet. Please sort the Target number in ascending order beforehand. It must have 4 columns:
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

# Supplementary information
## Check python version
To check, open Terminal or Command Prompt, then run the following command.

#### For Windows
```
py -3.10 --version
```
#### For Linux/MacOS
```
python3.10 --version
```
If you do not have python 3.10, download it from:
```
https://www.python.org/downloads/release/python-31011/
```

## Open Terminal in file location
1. Right click name of current folder on Path Bar, then click 'Open In Terminal' option

or

2. Open Terminal from Launchpad, then run
```
cd path/to/folder
```
For example, if your downloaded file is at Desktop/Archery/code, then the command would be
```
cd Desktop/Archery/code
```

## What if some packages are missing
#### For Windows
[Open Terminal in downloaded folder](#open-terminal-in-file-location) and run the following codes
```
./archery_ocr/Scripts/activate # activates virtual environment
pip install <package name>
deactivate # exits virtual environment

```

#### For Linux/MacOS
[Open Terminal in downloaded folder](#open-terminal-in-file-location) and run the following codes
```
source archery_ocr/bin/activate # activates virtual environment
pip3 install <package name>
deactivate # exits virtual environment
```

## Known issue
