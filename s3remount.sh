#!/bin/bash


df_rows=$(df | wc -l)


if [ $df_rows -eq 8 ]
then
	echo "nice"

else	
	echo "not nice"
fi
