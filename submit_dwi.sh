# define this variable as the basedir - it's our experiment's name in our file structure  
EXPERIMENT=experiment_name

# SUBJ is the anat directory where your images are held
SUBJ=("anat_dir_subject1" "anat_dir_subject2" "anat_dir_subject3")

# SUBJ2 is the output directory where your processed files will be placed
SUBJ2=("output_dir_subject1" "output_dir_subject2" "output_dir_subject3")

# runtype indicates the order of b1000, b2000, and t1 runs - use if this varies across subjects 
RUNTYPE=("runtype_case_subject1" "runtype_case_subject2" "runtype_case_subject3")

for k in 0;
do
	declare SUBJ=${SUBJ[$k]}
	declare SUBJ2=${SUBJ2[$k]}
	declare type2=${RUNTYPE[$k]}

	case $type2 in
		1) 
			RUNS=("b1000_run" "b2000_run" "t1_run");; # one order of b1000, b2000, t1 runs during scan session
		2) 
			RUNS=("b1000_run" "b2000_run" "t1_run");; # another order of b1000, b2000, t1 runs during scan session
		3) 
			RUNS=("b1000_run" "b2000_run" "t1_run");; # a third order of b1000, b2000, t1 runs during scan session 

		# add cases as necessary
		# remove this entire case statement or subparts of the cases as necessary 
	esac

	echo $SUBJ
	echo $SUBJ2

	declare RUN=${RUNS[0]}
	declare RUN2=${RUNS[1]}
	declare T1RUN=${RUNS[2]}

	echo $RUN
	echo $RUN2
	echo $T1RUN
		

	qsub -v EXPERIMENT=$EXPERIMENT qsub_dwi.sh ${SUBJ} ${SUBJ2} ${RUN} ${RUN2} ${T1RUN}

done

	
	

