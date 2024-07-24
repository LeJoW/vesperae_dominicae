#!zsh

inputTex=$1
lines=$2
name=$(basename "$inputTex" .tex)
outputPdf="build/$name.pdf"

if [ ! -z "$lines" ]; then
    option="trad-lines-count=$lines"
else
    option=
fi

lualatex --shell-escape --output-directory=build "$inputTex" "$option"
./pdfcrop --bbox "0 * * *" "$outputPdf" "$outputPdf"
