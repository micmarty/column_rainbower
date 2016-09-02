BEGIN{
	OFS = "\t" # column separator
}

{
	# DEFINE BASIC COLORS
	# normal colors
	# 0     1   2     3     4    5      6    7
	# black red green brown blue purple cyan gray

	# light colors
	# 0         1   2     3     4    5      6    7
	# dark gray red green yellow blue purple cyan white

	for(i = 0; i <= 7; i++){
		color_value=30+i
		nc[i]="\033[0;"color_value"m" # nc -> normal colors
		lc[i]="\033[1;"color_value"m" # lc -> light colors
	}
	rc="\033[0m" # rc -> reset color

	# PRINT EACH COLUMN WITH DIFFERENT COLOR
	for(i = 1;i <= NF; i++){
		if(i < 8)
			print_col_using_colors(i, nc) # use normal colours pallete
		else
			print_col_using_colors(i, lc) # use light colours pallete
	}
	printf "\n"

}

function print_col_using_colors(i, colors){
	printf "%s%s%s"OFS, colors[i%8], $i, rc # color, column, separator, reset color
}
