#Checking for old files and removing them
if [ -f data.txt ]
then
    rm data.txt
fi
if [ -f left.txt ]
then
    rm left.txt
fi
if [ -f right.txt ]
then
    rm right.txt
fi

#Editing the DATA file to get x and y coordinates
awk 'BEGIN {
            FS= ","
    }   {
    if ( $1 ~ /{"category":"tracker"/)
        print $7":"$8;
    RS = "\n";
    }' input.txt > data.txt


#Creating data file for left eye
awk 'BEGIN {
    FS = ":"
     }    {
    print $4":"$6
    }' data.txt > left.txt

#Creating data file for right eye
awk 'BEGIN {
            FS= ","
    }   {
    if ( $1 ~ /{"category":"tracker"/)
        print $16":"$17;
    RS = "\n";
    }' input.txt > data.txt

awk 'BEGIN {
    FS = ":"
     }    {
    print $4":"$6
    }' data.txt > right.txt

#Deleting extra characters 

sed 's/}//' left.txt > temp1.txt
sed 's/}//' right.txt > temp2.txt
cp temp1.txt left.txt
cp temp2.txt right.txt
rm -r temp1.txt temp2.txt
:'
echo “%” >> left.txt
echo "%" >> right.txt

#Reading a line each from both the files and storing it in a temp file
paste -d"\:" left.txt right.txt > lr.txt
#Constructing final data file
eof="%:%"
line1=""
while [ "$line1" != "$eof" ]
do
    read line1
    echo $line1
    x1="$(echo $line1 | cut -d ":" -f1)"
    y1="$(echo $line1 | cut -d ":" -f2)"
    x2="$(echo $line1 | cut -d ":" -f3)"
    y2="$(echo $line1 | cut -d ":" -f4)"
    t1=$(bc <<< "scale=2;$x1+$x2")
    t2=$(bc <<< "scale=2;$y1+$y2")  
    x=$(bc <<< "scale=2;$t1/2")
    y=$(bc <<< "scale=2;$t2/2")
    echo $x":"$y > data_athira.txt
done < lr.txt

#Deleting % from left and right files(NOT NEEDED LATER)

sed '$d' left.txt
sed '$d' right.txt
'

#Deleting 0 coordinates in both files

sed -i.bak '/0.0/d' ./left.txt
sed -i.bak '/0.0/d' ./right.txt

#Cleaning up backup files

rm left.txt.bak right.txt.bak

echo "File generation: SUCCESSFUL!"
echo "Creating final output file...."
gnuplot << EOF
    reset
    set term png size 1366,768
    set xrange[0:1366]
    set yrange[1366:0]
    
    set output "final.png"
    
    plot "left.txt","right.txt"
EOF
echo "Final Output generation: SUCCESSFUL!"    
