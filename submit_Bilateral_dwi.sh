EXPERIMENT=Bilateral.01
#test comment

SUBJ=("20170403_21938" "20170407_21957")
SUBJ2=("21938" "21957")
RUNTYPE=("5" "4")

for k in 0;
do
	declare SUBJ=${SUBJ[$k]}
	declare SUBJ2=${SUBJ2[$k]}
	declare type2=${RUNTYPE[$k]}

	case $type2 in
		1) 
			RUNS=("004" "005" "006");;
		2) 
			RUNS=("005" "006" "007");;
		3) 
			RUNS=("006" "007" "008");;
		4) 
			RUNS=("004" "005" "007");;
		5)
			RUNS=("005" "006" "008");;
		6) 
			RUNS=("005" "006" "003")
	esac


	echo $SUBJ
	echo $SUBJ2

	declare RUN=${RUNS[0]}
	declare RUN2=${RUNS[1]}
	declare T1RUN=${RUNS[2]}

	echo $RUN
	echo $RUN2
	echo $T1RUN
		

	qsub -v EXPERIMENT=$EXPERIMENT qsub_Bilateral_dwi.sh ${SUBJ} ${SUBJ2} ${RUN} ${RUN2} ${T1RUN}

done

	
	

