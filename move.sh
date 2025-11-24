#! /bin/bash
#
for dir in *; do
	files=$(ls $dir)
	# create empty list 
	for file in $files; do
		if [[ "$file" == *English*.srt ]]; then	
			srt_file="$dir/$file"
		elif [[ "$file" == *.mp4 ]];then
			video_file=$dir/$file
		fi
		if [[ -f "$srt_file" && -f "$video_file" ]]; then
			mkvmerge -o "${video_file%.mp4}.mkv" $video_file $srt_file
			rm ${video_file} ${srt_file}
		fi
	done
done
