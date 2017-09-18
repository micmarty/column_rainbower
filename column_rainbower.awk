BEGIN{
	# OFS - awk Built-in variable, stands for: Output Field Separator
	OFS = "\t" # column separation
}

{
	# DEFINE BASIC COLORS
	# standard colors - thin font
	# 0     1   2     3     4    5      6    7
	# black red green brown blue purple cyan gray

	# bold colors - more intense
	# 0         1   2     3     4    5      6    7
	# dark_gray red green yellow blue purple cyan white

	AVAILABLE_COLORS = 8
	COLOR_RESET = "\033[0m"

	# fill arrays with color symbols
	for(offset = 0; offset < AVAILABLE_COLORS; offset++){
		color_value = 30 + offset
		standard_colors[offset] = "\033[0;" color_value "m"
		bold_colors[offset] = "\033[1;" color_value "m"
	}
	

	# NF - awk Built-in variable, stands for: Number of Fields
	# it gives you the total number of columns

	# print each column using next color
	for(column = 1; column <= NF; column++){
		if(column < AVAILABLE_COLORS)
			print_col_using_colors(column, standard_colors) # use normal colours pallete
		else
			print_col_using_colors(column, bold_colors) # use light colours pallete
	}
	printf "\n"

}

function print_col_using_colors(column, colors){
	# 3 x column separator
	#					color
	#										column content
	#												 reset color
	printf "%s%s%s"OFS, colors[column % 8], $column, COLOR_RESET 
}
