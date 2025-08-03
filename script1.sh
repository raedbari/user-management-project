
#!/bin/bash
read -p "enter your name " name
read -p "enter your nickname " nickname

info=$name/$nickname

read -p  "confirm that you have entered the correct information. are you sure every thing is right  ? [y/n] " validation

case $validation in
    y|Y)
    echo $info >> emp.csv
    ;;
    n|N)
    exit
    ;;
    *)
    exit
    ;;
esac
echo "your info has been stored successfully in emp.csv file"
       