# GSFE curves

Here, we calculate the generalized stacking fault energy (GSFE) curves on {110}, {112}, and {123} planes in CrMoNbTa, CrNbTaW, MoNbTaV, and MoNbTaW. Since there are three types of planes and four MPEAs, you need to prepare 12 directories on your local computer and on Pod, respectively.

## {110} GSFE curves in CrMoNbTa

Take the {110} GSFE curve in CrMoNbTa as an example. First, on your local computer, download the six files in CrMoNbTa/110/ from this GitHub repository to a local directory `CrMoNbTa/110`. These six files are

- `lmp_gsfe.batch`, which is for job submission
- `110-gsfe.lmp`, which is the LAMMPS data file
- `lmp_gsfe_110.in`, which is the LAMMPS input file
- `CrMoNbTaVW_Xu2022.eam.alloy`, which is an interatomic potential file made by [Xu et al.](http://dx.doi.org/10.1016/j.commatsci.2021.110942)
- `gsfe_curve.sh`, which is the post-processing bash script
- `usfe_iss.m`, which is the MATLAB code used for calculating the unstable stacking fault energy (USFE) and ideal shear strength

Then on Pod, create a new directory in your `$HOME`. Say the directory is also `CrMoNbTa/110`. The commands are

`mkdir CrMoNbTa`

`cd CrMoNbTa`

`mkdir 110`

`cd 110`

Then upload, via Filezilla, the six files from your local computer to `110` on Pod.

### One {110} GSFE curve in CrMoNbTa

In your terminal emulator, submit the job by typing

`sbatch lmp_gsfe.batch`

then hit Return. To check the status of the job, type

`squeue -u $USER`

then hit Return. Once the job is finished successfully, you will find a lot of files in the directory `110`. One file is called `gsfe_ori`. In the same directory on Pod, type

`sh gsfe_curve.sh`

then hit Return. You will find a new file called `gsfe`. The first and second columns of this file, respectively, are the _x_ and _y_ axes of the GSFE curve.

Download `gsfe` to your local computer. Run `usfe_iss.m` in MATLAB to calculate the USFE and ideal shear strength _T_<sub>is</sub>. For more on these two quantities, read Section 3.2 of [this paper](http://dx.doi.org/10.1016/j.jmps.2020.104017).

### More {110} GSFE curves in CrMoNbTa

So far you have obtained one {110} GSFE curve, but for MPEAs, multiple GSFE curves exist even for the same type of slip plane. It is suggested that 20 GSFE curves be calculated for the {110} plane. To calculate another curve, in your terminal emulator, go to the `110` directory, edit the LAMMPS input file `lmp_gsfe_110.in`. In lines 14, 15, and 16, there are three random number seeds `1239`, `3534`, `4678`, respectively. Change any of the seeds to another integer, e.g., `6873`. For more information, please refer to [this page](https://lammps.sandia.gov/doc/set.html).

Then resubmit the job. Once it is finished, run `gsfe_curve.sh`, you will get another GSFE curve in a file `gsfe`. Save it to your local computer. Note: do not overwrite the previous `gsfe` file. Again, calculate USFE and _T_<sub>is</sub>.

Repeat the steps above 18 more times. Each time, change at least one random seed before you resubmit the job. Eventually, you will get 20 {110} GSFE curves, which would give you 20 USFE values, and 20 _T_<sub>is</sub> values. Calculate the mean and standard deviation of the 20 USFE values, as well as those of the 20 _T_<sub>is</sub> values. The mean should be close to the USFE based on the _A_ atom potential, which is the peak GSFE value in the file CrMoNbTa/110/gsfe\_A in this GitHub repository.

## {112} and {123} GSFE curves in CrMoNbTa

Repeat the steps above to get 20 {112} and 20 {123} GSFE curves in CrMoNbTa. Instead of CrMoNbTa/110/ in this GitHub repository, you will need the files in CrMoNbTa/112/ and CrMoNbTa/123/. Again, calculate mean and standard deviation of:

- 20 {112} USFE
- 20 {112} _T_<sub>is</sub>
- 20 {123} USFE
- 20 {123} _T_<sub>is</sub>

Note: the two mean USFEs should be close to the peak GSFE values in the files CrMoNbTa/112/gsfe\_A and CrMoNbTa/123/gsfe\_A, respectively.

## GSFE curves in CrNbTaW

Repeat the steps above to get 20 {110}, 20 {112}, and 20 {123} GSFE curves in CrNbTaW. Go to the three subdirectories under CrNbTaW/ in this GitHub repository. Obtain the mean and standard deviation of USFE and _T_<sub>is</sub>. Again, compare the mean USFE with the peak GSFE value in respective file gsfe\_A.

## GSFE curves in MoNbTaV

Repeat the steps above to get 20 {110}, 20 {112}, and 20 {123} GSFE curves in MoNbTaV. Go to the three subdirectories under MoNbTaV/ in this GitHub repository. Obtain the mean and standard deviation of USFE and _T_<sub>is</sub>. Again, compare the mean USFE with the peak GSFE value in respective file gsfe\_A.

Note: the interatomic potential file for this MPEA is different from that for the other three MPEAs.

## GSFE curves in MoNbTaW

Repeat the steps above to get 20 {110}, 20 {112}, and 20 {123} GSFE curves in MoNbTaW. Go to the three subdirectories under MoNbTaW/ in this GitHub repository. Obtain the mean and standard deviation of USFE and _T_<sub>is</sub>. Again, compare the mean USFE with the peak GSFE value in respective file gsfe\_A.

## Results

Eventually, you will have 20 x 3 x 4 = 240 different GSFE curves. You will also have 3 x 4 = 12 different mean and standard deviation of USFE, and those of _T_<sub>is</sub>.

## References

If you use the interatomic potential file from this GitHub repository, please cite

- Shuozhi Xu, Saeed Zare Chavoshi, Yanqing Su, [On calculations of basic structural parameters in multi-principal element alloys using small atomistic models](http://dx.doi.org/10.1016/j.commatsci.2021.110942), Comput. Mater. Sci. 202 (2022) 110942

If you use any other files from this GitHub repository, please also cite

- Rebecca A. Romero, Shuozhi Xu, Wu-Rong Jian, Irene J. Beyerlein, C.V. Ramana, [Atomistic calculations of the local slip resistances in four refractory multi-principal element alloys](http://dx.doi.org/10.1016/j.ijplas.2021.103157), Int. J. Plast. 149 (2022) 103157
- Shuozhi Xu, Emily Hwang, Wu-Rong Jian, Yanqing Su, Irene J. Beyerlein, [Atomistic calculations of the generalized stacking fault energies in two refractory multi-principal element alloys](http://dx.doi.org/10.1016/j.intermet.2020.106844), Intermetallics 124 (2020) 106844