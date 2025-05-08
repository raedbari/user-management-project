# Linux User Management Script

## 📌 Project Description

This project contains two Bash scripts designed to automate the process of creating Linux users from a CSV file. The main goal is to simplify the user creation process for system administrators, while ensuring safety by preventing duplicate users from being added.

## 📁 Files Included

- `script1.sh`: Collects user input (username and nickname) and stores it in `emp.csv`.
- `script2.sh`: Reads the `emp.csv` file and creates system users with random passwords.

---

## 🧩 How It Works

### Step 1 – Add User Info

Run the following script to collect a user's name and nickname:

```bash
./script1.sh
```

This script:
- Prompts for name and nickname.
- Asks for confirmation.
- Saves the information to `emp.csv` in the format: `name/nickname`.

vim script1.sh
- [create-user-script1.sh](./script1.sh)
---

### Step 2 – Create Users

Run the user creation script **as root**:

```bash
# Note: script2 should only be run with root privileges.
# Always use sudo before executing it.
sudo ./script2.sh 

```

This script:
- Checks if the script is run as root.
- Verifies that the CSV file `emp.csv` exists.
- Reads each line in the format `name/nickname`.
- If the user already exists, it skips creating the user.
- If the user does **not** exist:
  - Generates a secure random password.
  - Creates the user and sets the password.
  - Forces the user to change the password at the first login.
  - Saves the user and password to `emp.txt`.
- Logs errors and warnings to `logs.log`.

vim script2.sh
- [user-script2.sh](./script2.sh)
---

## 🛡 Features

- Prevents duplicate users.
- Logs errors and success messages.
- Ensures users change passwords on first login.
- Generates secure random passwords using `openssl`.

---

## 📂 Example CSV Format (`emp.csv`)

```
raed/bari
alrubaidy/Ali
```

---

## ⚠ Requirements

A Linux environment, such as an EC2 instance or any local/remote Linux server.

SSH access to the server using a client like MobaXterm
---

## ✅ Sample Output

```
User created successfully: raed
Nickname: bari
Random Password: gY89Dk+8
--------------------------
```

If a user already exists:

```
User raed already exists. Skipping...
--------------------------
```