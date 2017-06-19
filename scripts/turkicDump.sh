#! /bin/bash

vatic_path=$HOME/annotation/vatic
annotation_path=$HOME/Desktop/vaticAnnotation
groundtruth_path=$annotation_path/groundTruth-raw

cd $vatic_path
mkdir -p $groundtruth_path

for v in `cat $annotation_path/finished_identifier.txt`;do
	echo ===========================$v========================

	out_name=$groundtruth_path/$v"_gt.txt"
	if [[ ! -f $out_name ]];then
		turkic dump $v -o $out_name
	else
		echo "--> Already extracted: $v"
	fi
	
done
