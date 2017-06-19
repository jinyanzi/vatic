#! /bin/bash

annotation_dir=$HOME/Dropbox/annotation
video_dir=$annotation_dir/fullVideos
trim_video_dir=$annotation_dir/trimmedVideos
timestep_txt=$annotation_dir/startEndTime.txt

cd $annotation_dir
for v in `ls $video_dir`;do
	if [[ ! -f $trim_video_dir/$v ]];then
		filename="${v%.*}"
		start_time=$(awk -v vname="$filename" '{if($1 == vname) print $2;}' $timestep_txt)
		echo $v
		ffmpeg -i $video_dir/$v -ss $start_time -t 00:05:00 -codec copy $trim_video_dir/$v
	else
		echo "--> Already trimmed: $v"
	fi
done
