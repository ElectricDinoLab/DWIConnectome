# DWIConnectome
## Overview: 
- Here you will find submit and qsub scripts for running a DWI connectome pipeline on a cluster server. 
- This pipeline outputs ACT-processed and ACT+SIFT-processed 471x471 connectomes for both fractional anisotropy (FA) and streamline values.

## Requirements:
- DWI data in NIfTI format (nii.gz) 
  - bvec file (or a .bxh file that contains bvec inputs)
  - bval file (or a .bxh file that contains bval inputs)
  - T1-image
  - DWI-images containing b=0 and two shell volumes (see step 5.a under preparation steps for instructions about one versus two-shell scans) 
- FSL library (https://fsl.fmrib.ox.ac.uk/fsl/fslwiki)
- MRtrix3 toolbox (http://www.mrtrix.org/)

## Steps for preparing to run DWI connectome analyses:
1. Designate EXPERIMENT variable at the top of the qsub script.
  - This is your base directory (see Directory Structure below).
2. Edit the SUBJ array.
  - This is the name of the directory that contains the subject’s data.
3. Edit the SUBJ2 array.
  - This is the subject’s identification number included in the file-naming convention.
  - This also will be the name of the directory where the subject’s connectome outputs are placed.
4. Edit the RUNTYPE array – if applicable.
  - This array uses the case esac statement in the submit script. The order of the RUN arrays goes: b=1000 run, b=2000 run, T1 run. 
  - This allows for flexibility in file naming convention between subjects that are all run through the connectome script in the same go. It is highly dependent on your file-naming convention
5. Overall, edit the script as necessary to match your own file-naming and data organization system. 
  - In particular, the script is written for two shells of DWI data, so edit the MERGE section of the qsub script if you are only analyzing one-shell DWI data.

## Directory Structure: 
```
EXPERIMENT
│
└───DATA
    │
    └───ANAT
    │	│
    │	└───SUBJ
    │	
    └───PREPROCESSING
      │
      └───SUBJ2
```

## Steps for running DWI connectome analysis:
1. Log in to your cluster server.
2. Navigate to the directory containing the submit script.
3. Run the submit script, which will call the qsub script for all subjects in the SUBJ and SUBJ2 arrays.
4. The qsub script has run successfully when all subjects have the following four documents in their SUBJ2 directory, and all four of these documents contain a 471x471 matrix:
  - SUBJ2_FAconnectome_ACT: this is a 471 x 471 matrix of fractional anisotropy values (FA) that have undergone anatomically constrained tractography (MRtrix3 commands 5ttgen and tckgen with the –act flag).
  - SUBJ2_STRconnectome_ACT: this is a 471 x 471 matrix of streamline values (total fibers between two ROIs) that have undergone anatomical constrained tractography (MRtrix3 commands 5ttgen and tckgen with the –act flag).
  - SUBJ2_FAconnectome_ACTSIFT: this is a 471 x 471 matrix of fractional anisotropy values (FA) that have undergone both anatomical constrained tractography (MRtrix3 commands 5ttgen and tckgen with the –act flag) AND spherical-deconvolution informed filtering of tractograms (SIFT; MRtrix3 command tcksift).
  - SUBJ2_STRconnectome_ACTSIFT: this is a 471 x 471 matrix of streamline values (total fibers between two ROIs)  that have undergone both anatomical constrained tractography (MRtrix3 commands 5ttgen and tckgen with the –act flag) AND spherical-deconvolution informed filtering of tractograms (SIFT; MRtrix3 command tcksift).

## Abbreviations:
  - DWI = Diffusion Weighted Imaging 
  - NIfTI = Neuroimaging Informatics Technology Initiative 
  - ACT = Anatomically Constrained Tractography 
  - SIFT = Spherical-deconvolution Informed Filtering of Tractograms
  - FA = Fractional Anisotropy 
  - STR = Streamline 




