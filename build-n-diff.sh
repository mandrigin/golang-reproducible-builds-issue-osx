#!sh

go build -asmflags -trimpath -ldflags=-buildid= -o t1 .
go build -asmflags -trimpath -ldflags=-buildid= -o t2 .

HASHER=sha1sum

if ! command -v $HASHER &> /dev/null
then
    HASHER=shasum
fi

$HASHER < t1
$HASHER < t2

xxd t1 > x1 
xxd t2 > x2

echo "DIFF_BEGIN"
diff x1 x2
echo "DIFF_END"

rm t1 t2 x1 x2

