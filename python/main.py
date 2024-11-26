import os
import subprocess

def execute_user_command():
    # Insecure use of subprocess that allows arbitrary command injection
    user_input = input("Enter a shell command: ")
    subprocess.run(user_input, shell=True)  # Bandit will flag this (B602)

def create_file():
    # Use of world-writable permissions
    os.chmod("important_file.txt", 0o777)  # Bandit will flag this (B103)

if __name__ == "__main__":
    execute_user_command()
    create_file()
