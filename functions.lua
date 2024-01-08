-- Creates the needed variables.
local user_input = nil
local position = nil
usernames = {}
passwords = {}
acount_balences = {}
acount_balence = 0
log = ""

-- The page generation and mechanics for the login page.
function login_page()
  print("1. Sign up") -- Questions the user.
  print("2. Log In")
  local user_input = tonumber(io.read())
  os.execute("clear")
  
  if user_input == 1 then -- Evaluates the response.
    sign_up()
  elseif user_input == 2 then
    log_in()
  else
    print("Sorry, " .. tostring(user_input) .. " is not an option.")
    os.execute("sleep 2")
    os.execute("clear")
    login_page()
  end
end

-- Create a new account.
function sign_up()
  print("Username:")
  local user_input = io.read()
  local user_input = string.lower(user_input)
  
  if count_occurrences(usernames, user_input) > 0 then -- Checks if the username is already in the program.
    print("Username already exists. Please choose a different username.")
    os.execute("sleep 2")
    os.execute("clear")
    sign_up()
  else
    table.insert(usernames, user_input) -- Create a new login.
    table.insert(acount_balences, 0)
    update_acount_balence(acount_id)
    local position = find_item_position(usernames, user_input) -- Gets account position and ID.
    acount_id = position
    os.execute("clear")
    print("Password:")
    local user_input = io.read()
    table.insert(passwords, user_input)
    os.execute("clear")
    
    print("You have been sucsesfully logged in.") -- Prints login message.
    os.execute("sleep 2")
    log = ""
    render_home()
  end
end

-- Counts if the username is in the tables.
function count_occurrences(table, value)
    local count = 0
    for _, v in ipairs(table) do
        if v == value then
            count = count + 1
        end
    end
    return count
end

-- Finds the position of the user/password.
function find_item_position(list, item)
    for i, v in ipairs(list) do
        if v == item then
            return i 
        end
    end
    return nil
end


-- Log in to the account.
function log_in()
  print("Username:") -- Gathers username.
  local user_input = io.read()
  local user_input = tostring(user_input)
  if not count_occurrences(usernames, user_input) == 1 then
    os.execute("clear")
    print("Sorry, it looks like your username is not in our database.")
  end
  local user_input = string.lower(user_input)
  local position = find_item_position(usernames, user_input)
  acount_id = position
  os.execute("clear")

  print("Password:") -- Gathers the password.
  local user_input = io.read()
  local user_input = tostring(user_input)
  os.execute("clear")

  if passwords[position] == user_input then -- Checks if the username matches the password.
    print("You have been sucsesfully logged in.")
    os.execute("sleep 2")
    log = ""
    render_home()
  else
    print("Sorry, your username and password did not match.")
    os.execute("sleep 2")
    os.execute("clear")
    login_page()
  end
end


-- Renders the homepage.
function render_home()
  update_acount_balence(acount_id)
  os.execute("clear")
  print("Welcome to Banking With Lua!")
  print("")
  print("Acount ID: " .. acount_id)
  print("")
  print("Acount balence: $" .. tostring(acount_balence) .. "                                       " .. current_time())
  print("-------------------------------------------------------------------------------------")
  print("1.Withdrawl")
  print("2.Deposit")
  print("3.List Recent Transactions")
  print("4.Log out")
  user_input = tostring(io.read()) -- Handles the user input.
  
  if user_input == "1" then -- Decides what to do with the user input.
    withdrawl()
  elseif user_input == "2" then
    deposit()
  elseif user_input == "3" then
    list_recent_transactions()
  elseif user_input == "4" then
    exit()
  end
end

-- Updates the user's balance.
function update_acount_balence(id)
  acount_balence = acount_balences[id]
end

-- Handles when the user wants to withdraw money.
function withdrawl()
  os.execute("clear")
  print("Withdrawl")
  print("-------------------------------------------------------------------------------------")
  print("How much money would you like to withdrawl?")
  local user_input = io.read()
  if has_letters(user_input) then -- Checks if the user added letters to their input.
    os.execute("clear")
    print("Withdrawl")
    print("-------------------------------------------------------------------------------------")
    print("Sorry, we only accept numberd responces.")
    os.execute("sleep 2")
    render_home()
  end

  
  if user_input < 1 then -- Checks if the user inputted a value more than one.
    os.execute("clear")
    print("Withdrawl")
    print("-------------------------------------------------------------------------------------")
    print("Sorry, you cannot withdtawl less then $1")
    os.execute("sleep 2")
    render_home()
  end

  if tonumber(user_input) > tonumber(acount_balence) then -- Makes sure the user is not depositing more than they have.
    os.execute("clear")
    print("Withdrawl")
    print("-------------------------------------------------------------------------------------")
    print("Sorry, but you are unable to withdrawl more than you own.")
    render_home()
  else
    acount_balences[acount_id] = acount_balences[acount_id] - tonumber(user_input) -- Updates the table.
    log = log .. "-" .. user_input .. ", " -- Updates the log.
    os.execute("clear")
    print("Withdrawl")
    print("-------------------------------------------------------------------------------------")
    print("Acount balence sucsesfully changed.")
    os.execute("sleep 2")
    render_home()
  end
end

-- Handles when the user wants to deposit money.
function deposit()
  os.execute("clear")
  print("Deposit")
  print("-------------------------------------------------------------------------------------")
  print("How much money would you like to deposit?")
  local user_input = io.read()
  
  if has_letters(user_input) then -- Checks there are no letters in the user input.
    os.execute("clear")
    print("Deposite")
    print("-------------------------------------------------------------------------------------")
    print("Sorry, we only accept numberd responces.")
    os.execute("sleep 2")
    render_home()
  end
  
  if tonumber(user_input) < 1 then -- Makes sure the user's input is not a negative value.
    os.execute("clear")
    print("Deposite")
    print("-------------------------------------------------------------------------------------")
    print("Sorry, you cannot deposite less then $1")
    os.execute("sleep 2")
    render_home()
  end

  acount_balences[acount_id] = acount_balences[acount_id] + tonumber(user_input) --Updates the table. 
  log = log .. "+" .. user_input .. ", " -- Updates the log.
  os.execute("clear")
  print("Deposite")
  print("-------------------------------------------------------------------------------------")
  print("Acount balence sucsesfully changed.")
  os.execute("sleep 2")
  render_home()
end

-- Lists recent transactions.
function list_recent_transactions()
  os.execute("clear")
  print("Log")
  print("-------------------------------------------------------------------------------------")
  print("Current acount balence: $" .. acount_balence)
  print("")
  print(log)
  print("")
  print("Press ENTER to return to home")
 
  user_input = io.read() -- Waits for the user to press Enter to render_home().
  render_home()
end

-- Log out.
function exit()
  os.execute("clear")
  login_page()
end

-- Checks if the input has letters.
function has_letters(input)
  for i = 1, #input do
    local char = input:sub(i, i)
     if char:match("%a") then
      return true 
     end
   end
   return falsed
end

-- Formats the time and date.
function current_time()
  return os.date("%Y-%m-%d %H:%M")
end
