NAME=$1
TEMPNAME=$(mktemp -d "temp.XXXXXXXXXXXXXXX")
tar -xzf $NAME -C $TEMPNAME
grep -rl "DELETE ME!" "$TEMPNAME" | xargs rm
tar -zcf "cleaned_$NAME" $TEMPNAME
