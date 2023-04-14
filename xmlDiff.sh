
#!/bin/bash
input="input1.txt"
substr=">"
echo "" > a.txt
echo "" > b.txt
while IFS= read -r line
do
    prefix=${line%%$substr*}
    index=${#prefix}
 
    if [[ index -ne ${#str} ]];
    then
        echo ${line:0:$index} >> a.txt
    fi
done < "$input"

echo "\n" >> a.txt
echo "\n" >> b.txt

input3="input2.txt"

while IFS= read -r searchString
do
    echo "Searching for ...... ${searchString}"
    found=0
    line=""
    while IFS= read -r frenchString
    do 
        # echo "in ${frenchString}"
        if [[ $frenchString == *"${searchString}"* ]];
        then
            found=1
            break
        else
            line=$searchString
        fi
    done < "$input3"

    if [ $found -eq 1 ]
    then 
        echo ""
    else 
        echo "Did not find ${line}" 
        foundd=0
        ln=""
        while IFS= read -r str
        do 
            echo "checking with ${str}"
            if [[ $str == *"${line}"* ]];
            then
                echo $str >> b.txt
                break
            else
                ln=$str
            fi
        done < "$input"
    fi

done < "a.txt"

echo "\n" >> b.txt 