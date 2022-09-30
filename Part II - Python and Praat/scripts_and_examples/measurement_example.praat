clearinfo

input_path$ = "/home/philipp/Documents/example/test/"

results_directory$ = input_path$

results_file$ = input_path$ + "results.txt"

writeFileLine: results_file$, "FileName",tab$,"Label",tab$,"Time",tab$,"Amplitude"

Create Strings as file list: "GridList", "'input_path$'*.TextGrid"

ttip_channel = 2
landmark_tier = 2


number_of_files = Get number of strings

for file_idx from 1 to number_of_files
	selectObject: "Strings GridList"
	grid_name$ = Get string: file_idx
	Read from file: "'input_path$''grid_name$'"
	name$ = selected$("TextGrid")
	Read from file: "'input_path$''name$'.wav"

	selectObject: "TextGrid 'name$'"
	number_of_landmarks = Get number of points: landmark_tier
	for point_idx from 1 to number_of_landmarks
		
		selectObject: "TextGrid 'name$'"
		label$ = Get label of point: landmark_tier, point_idx
		time_point = Get time of point: landmark_tier, point_idx
		
		selectObject: "Sound 'name$'"
		amplitude_value = Get value at time: ttip_channel, time_point, "sinc70"
		
		appendFileLine: results_file$, "'name$''tab$''label$''tab$''time_point''tab$''amplitude_value'"
	endfor
	removeObject: "TextGrid 'name$'", "Sound 'name$'"

endfor

removeObject: "Strings GridList"

printline done!