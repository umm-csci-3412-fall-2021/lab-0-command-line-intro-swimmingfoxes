NAME=$1
TEMPNAME=$(mktemp -d "temp.XXXXXXXXXXXXXXX")
tar -xzf $NAME -C $TEMPNAME
grep -rl "DELETE ME!" "$TEMPNAME" | xargs rm
OLDPATH=$(pwd)
cd $TEMPNAME
tar -zcf "cleaned_$NAME" "$($NAME | cut -f 1 -d '.')"
mv "cleaned_$NAME" $OLDPATH
