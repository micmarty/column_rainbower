BEGIN { OFS = "\t"} # column separator
{
	
	for(i=0;i<=7;i++){
		color_value=30+i
		nc[i]="\033[0;"color_value"m" # nc -> normal colors
		lc[i]="\033[1;"color_value"m" # lc -> light colors
	}

	rc="\033[0m" # rc -> reset color
	for(i=1;i<=NF;i++)
	{
		printf "%s%s%s"OFS, nc[i], $i, rc
	}
	printf "\n"

}
