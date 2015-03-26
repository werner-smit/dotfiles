EXCLUDES=".git . .."

for f in .*;
do
    is_in_exclude=0
    for exclude in $EXCLUDES;
    do
        if [ "$f" = "$exclude" ]
        then
            is_in_exclude=1
        fi
    done

    if [ $is_in_exclude -eq 1 ];
    then 
        echo "Skipping $f"
    else
        echo "Creating symlink: ln -s $(pwd)/$f ~/"
        ln -s $(pwd)/$f ~/
    fi
    #echo $f
done
