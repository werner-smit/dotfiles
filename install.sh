EXCLUDES=".git . .."

DFPATH=$(dirname $(readlink -f "$0"));
INSTALLPATH="$(realpath ~/)"
cd $DFPATH

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

    abspath=$(pwd)/$f
    absinstallpath=$INSTALLPATH/$f
    if [ ! $is_in_exclude -eq 1 ];
    then
        if [[ -L $absinstallpath || ! -f $absinstallpath ]]
        then
            echo "[Re]creating symlink: ln -is $abspath $absinstallpath"
            ln -sf $abspath $INSTALLPATH;
        else
            echo "WARNING: Destination already exists. Backup create for '$abspath'"
            ln -sf $abspath $INSTALLPATH
        fi;
    fi
done
echo "Installation done."
