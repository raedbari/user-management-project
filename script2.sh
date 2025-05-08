#!/bin/bash
csv_file=emp.csv

if [ "$UID" -ne 0 ]; then
    echo "sorry, this script requires root privileges" | tee -a logs.log
    exit 1
fi

if [ ! -f "$csv_file" ]; then
    echo "There is no csv file: $csv_file" | tee -a logs.log
    exit 1
fi

while IFS=/ read -r name nickname; do
    if id "$name" &>/dev/null; then
        echo " User $name already exists. Skipping..." |  tee -a logs.log
        echo "--------------------------"
        continue
    fi

    password=$(openssl rand -base64 8)
    useradd -m -c "$nickname" "$name"

    if [ $? -eq 0 ]; then
        echo "$name:$password" | chpasswd
        chage -d 0 "$name"

        echo " User created successfully: $name"  
        echo "Nickname: $nickname"
        echo "Random Password: $password"
        echo "$name:$password" >> emp.txt
    else
        echo " Failed to create user: $name"  |  tee -a logs.log
    fi

    echo "--------------------------"
done < "$csv_file"

echo " All possible user creations attempted."  
