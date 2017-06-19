#! /bin/bash

vatic_path=$HOME/annotation/vatic
annotation_path=$HOME/Desktop/vaticAnnotation
video_path=$annotation_path/trimmedVideos
frame_path=$annotation_path/frames

cd $vatic_path
for v in `ls $video_path`;do
	filename=${v%.*}
	fileformat=${v#$filename}	#	$fileformat has a dot in the beginning
	echo ===========================$filename========================
	# replace spaecial character for python processing
	py_filename=${filename//\(/\\\(}
	py_filename=${py_filename//\)/\\\)}
	py_filename=${py_filename//\./\\.}
	py_filename=${py_filename//\&/\\&}
	py_filename=${py_filename//\@/\\@}

	py_v=$py_filename$fileformat

	echo $filename $py_filename
	output_dir=$annotation_path/frames/$filename
	output_py_dir=$annotation_path/frames/$py_filename
	
	if [[ ! -d $frame_path/$filename ]];then
		echo "Extracting video $filename" 
		turkic extract $video_path/$py_v $output_dir --no-resize
		turkic load $filename $output_dir vehicle people --offline --length 500 --overlap 20
		turkic publish --offline | tail -n 1 # output the last segment url of the video
	else
		echo "--> Already extracted: $filename"
	fi
	
done
