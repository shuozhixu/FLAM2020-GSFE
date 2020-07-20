# GSFE curves

Here, we calculate the GSFE curves on {110}, {112}, {123} planes in CrNbTaW and CrMoNbTa. Since there are three types of planes and two HEAs, you need to prepare six directories on your own computer and on Pod, respectively.

## {110} GSFE curves in CrNbTaW

Take the {110} plane in CrNbTaW as an example. First, on your own computer, download the five files in CrMoNbTa/110/ in this github repository to a local directory `CrMoNbTa/110`. These five files are

- `lmp_gsfe.batch`, which is for job submission
- `110-gsfe.lmp`, which is the LAMMPS data file
- `lmp_gsfe_110.in`, which is the LAMMPS input file
- `MoTaWNbCr_Zhou04.eam.alloy`, which is a new interatomic potential file developed by Wu-Rong Jian
- `gsfe_curve.sh`, which is the post-processing bash script

Then on Pod, create a new directory in your `$HOME`. Say the directory is also `CrMoNbTa/110`. The command is

`mkdir CrMoNbTa`

`cd CrMoNbTa`

`mkdir 110`

`cd 110`

Then upload, via Filezilla, the five files from your local computer to `110` on Pod.

### One {110} GSFE curve in CrNbTaW

In your terminal emulator, submit the job by typing

`sbatch lmp_gsfe.batch`

then hit Return. To check the status of the job, type

`squeue -u $USER`

then hit Return. Once the job is finished successfully, you will find a lot of files in the directory. One file is called `gsfe_ori`. In the same directory on Pod, type

`sh gsfe_curve.sh`

then hit Return. You will find a new file called `gsfe`. The first and second columns of this file, respectively, are the _x_ and _y_ axes of the GSFE curve. Download `gsfe` to your local computer.

### More {110} GSFE curves in CrNbTaW

So far you have obtained one {110} GSFE curve, but for HEAs, multiple GSFE curves exist even for the same type of slip plane. It is suggested that 20 GSFE curves are calculated for the {110} plane. To calculate another curve, in your terminal terminator, go to the `110` directory, edit the LAMMPS input file `lmp_gsfe_110.in`. In lines 14, 15, and 16, there are three random number seeds `1239`, `3534`, `4678`. Change any of the seeds to another integer, e.g., `6873`. Then resubmit the job. Once it is finished, run `gsfe_curve.sh`, you will get another GSFE curfve in a file `gsfe`. Save it to your local computer. Note: do not overwrite the previous `gsfe` file.

Repeat the steps above 18 times. Each time, change at least one random seed before you resubmit the job. Eventually, you will get 20 {110} GSFE curves.

## {112} and {123} GSFE curves in CrNbTaW

Repeat the steps above to get 20 {112} and 20 {123} GSFE curves in CrNbTaW.

## GSFE curves in CrMoNbTa

Repeat the steps above to get 20 {110}, 20 {112}, and 20 {123} GSFE curves in CrMoNbTa.

## Results

Eventually, you will have 20 x 3 x 2 = 120 different GSFE curves.