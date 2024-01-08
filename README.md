# Lua Banking System
This simple banking system implemented in Lua allows users to create accounts, log in, and perform basic banking transactions such as withdrawals and deposits. The system keeps track of user information, account balances, and transaction logs.

# Prerequisites
Lua interpreter

# How to Run
Save the provided main.lua file to your local machine.
Ensure you have the Lua interpreter installed.
Open a terminal or command prompt and navigate to the directory where main.lua is saved.
Run the script by executing the command: lua main.lua

# Features
Account Creation: Users can sign up by providing a unique username and password.
Account Login: Existing users can log in using their credentials.
Withdrawal: Users can withdraw money from their accounts, provided they have sufficient balance.
Deposit: Users can deposit money into their accounts.
Transaction Log: The system maintains a log of recent transactions for each user.
Logout: Users can log out, returning to the login page.

# Usage
Run the script.
Follow the on-screen instructions to sign up or log in.
Once logged in, navigate through the options to perform transactions or view recent transactions.
Log out when finished.

# Code Structure
functions.lua: Contains utility functions used in main.lua.
main.lua: The main script implementing the banking system.

# Important Functions
login_page(): Displays the login/signup menu and redirects accordingly.
sign_up(): Creates a new account with a unique username and password.
log_in(): Logs into an existing account with the correct username and password.
render_home(): Displays the main menu after login, allowing users to perform various transactions.
withdrawal() and deposit(): Perform withdrawal and deposit transactions, respectively.
list_recent_transactions(): Displays recent transactions and returns to the main menu.
exit(): Logs out and returns to the login page.

# Updated Functions in functions.lua
render_home(): Displays the main menu after login, allowing users to perform various transactions. Now includes a timestamp.
withdrawal() and deposit(): Perform withdrawal and deposit transactions, respectively. Includes input validation and additional checks.
has_letters(input): Checks if the input contains letters.
current_time(): Returns the formatted current date and time.
