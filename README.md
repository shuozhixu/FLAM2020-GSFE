# GSFE curves

Here, we calculate the generalized stacking fault energy (GSFE) curves on {110}, {112}, {123} planes in CrMoNbTa and CrNbTaW. Since there are three types of planes and two HEAs, you need to prepare six directories on your local computer and on Pod, respectively.

## {110} GSFE curves in CrMoNbTa

Take the {110} GSFE curve in CrMoNbTa as an example. First, on your local computer, download the five files in CrMoNbTa/110/ from this github repository to a local directory `CrMoNbTa/110`. These five files are

- `lmp_gsfe.batch`, which is for job submission
- `110-gsfe.lmp`, which is the LAMMPS data file
- `lmp_gsfe_110.in`, which is the LAMMPS input file
- `MoTaWNbCr_Zhou04.eam.alloy`, which is an interatomic potential file developed by Wu-Rong Jian
- `gsfe_curve.sh`, which is the post-processing bash script

Then on Pod, create a new directory in your `$HOME`. Say the directory is also `CrMoNbTa/110`. The commands are

`mkdir CrMoNbTa`

`cd CrMoNbTa`

`mkdir 110`

`cd 110`

Then upload, via Filezilla, the five files from your local computer to `110` on Pod.

### One {110} GSFE curve in CrMoNbTa

In your terminal emulator, submit the job by typing

`sbatch lmp_gsfe.batch`

then hit Return. To check the status of the job, type

`squeue -u $USER`

then hit Return. Once the job is finished successfully, you will find a lot of files in the directory `110`. One file is called `gsfe_ori`. In the same directory on Pod, type

`sh gsfe_curve.sh`

then hit Return. You will find a new file called `gsfe`. The first and second columns of this file, respectively, are the _x_ and _y_ axes of the GSFE curve.

Download `gsfe` to your local computer. Calculate the peak GSFE value, which is the unstable stacking fault energy (USFE). Also, calculate the ideal shear strength _T_<sub>is</sub> using Equations 7 and 8 of [this paper](http://dx.doi.org/10.1016/j.jmps.2020.104017). Note that _d<sub>z</sub>_ is in units of the magnitude of the Burgers vector _b_, which can be derived from the lattice parameter: 0.31878 nm.

### More {110} GSFE curves in CrMoNbTa

So far you have obtained one {110} GSFE curve, but for HEAs, multiple GSFE curves exist even for the same type of slip plane. It is suggested that 20 GSFE curves be calculated for the {110} plane. To calculate another curve, in your terminal emulator, go to the `110` directory, edit the LAMMPS input file `lmp_gsfe_110.in`. In lines 14, 15, and 16, there are three random number seeds `1239`, `3534`, `4678`, respectively. Change any of the seeds to another integer, e.g., `6873`. For more information, please refer to [this page](https://lammps.sandia.gov/doc/set.html).

Then resubmit the job. Once it is finished, run `gsfe_curve.sh`, you will get another GSFE curfve in a file `gsfe`. Save it to your local computer. Note: do not overwrite the previous `gsfe` file. Again, calculate USFE and _T_<sub>is</sub>.

Repeat the steps above 18 more times. Each time, change at least one random seed before you resubmit the job. Eventually, you will get 20 {110} GSFE curves, which would give you 20 USFE values, and 20 _T_<sub>is</sub> values. Calculate the mean and standard deviation of the 20 USFE values, as well as those of the 20 _T_<sub>is</sub> values. The mean should be close to the USFE of based on the _A_ atom potential, which is the peak GSFE value in the file CrMoNbTa/110/gsfe\_A in this github repository.

## {112} and {123} GSFE curves in CrMoNbTa

Repeat the steps above to get 20 {112} and 20 {123} GSFE curves in CrMoNbTa. Instead of CrMoNbTa/110/ in this github repository, you will need the files in CrMoNbTa/112/ and CrMoNbTa/123/. Again, calculate mean and standard deviation of:

- 20 {112} USFE
- 20 {112} _T_<sub>is</sub>
- 20 {123} USFE
- 20 {123} _T_<sub>is</sub>

Note: the two mean USFEs should be close to the peak GSFE values in the files CrMoNbTa/112/gsfe\_A and CrMoNbTa/123/gsfe\_A, respectively.

## GSFE curves in CrNbTaW

Repeat the steps above to get 20 {110}, 20 {112}, and 20 {123} GSFE curves in CrNbTaW. Go to the three subdirectories under CrNbTaW/ in this github repository. Obtain the mean and standard devitaion of USFE and _T_<sub>is</sub>. Note:

- When calculating _T_<sub>is</sub>, use the lattice parameter for this material: 0.31746 nm.
- Again, compare the mean USFE with the peak GSFE value in respective file gsfe\_A.

## Results

Eventually, you will have 20 x 3 x 2 = 120 different GSFE curves. You will also have 3 x 2 = 6 different mean and standard deviation of USFE, and those of _T_<sub>is</sub>.