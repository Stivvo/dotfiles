#!/bin/bash

PAKDIR=$XDG_CONFIG_HOME/nvim/pack/plugins
mkdir -p $PAKDIR/$1
while IFS= read -r line;
do
	if [ ${line:0:1} != "#"  ]
	then
		AUTHOR=${line%/*}
		NAME=${line#*/}
		PLUGDIR=$PAKDIR/$1/$NAME
		echo $AUTHOR $NAME
		if [ -d $PLUGDIR ]
		then
			sh -c "cd $PLUGDIR && git pull"
		else
			sh -c "cd $PAKDIR/$1/ && git clone https://github.com/$line"
		fi
	fi
done < ./nvim/plug$1.conf
