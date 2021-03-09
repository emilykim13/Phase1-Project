require_relative '../config/environment'

def welcome
title = Artii::Base.new(:font => "slant")
puts title.asciify("Gym Time!!")
end

def login 
    users = User.all.map {|user| user.user_name} # made array of our usernames set to 'users'
    prompt = TTY::Prompt.new
    login_choice = prompt.select("What would you like to do?", ["Login", "Sign Up", "Exit"])
        if login_choice == "Login"
            current_username = prompt.ask("What is your username?".green)
            current_password = prompt.ask("Enter your password.".green)
            if users.include?(current_username) && User.all.find_by(password: current_password)
                puts "Let's Workout!".green
            else
                puts "Incorrect username or password.".red
                ## 
                login_try_again = TTY::Prompt.new
                try_again = login_try_again.select("Would you like to try again?".light_yellow, ["Yes", "No"])
                if try_again == "Yes"
                    current_username = prompt.ask("What is your username?").light_yellow
                    current_password = prompt.ask("Enter your password.").light_yellow
                    if users.include?(current_username) && User.all.find_by(password: current_password)
                        puts "Let's Workout!".green
                    end
                else try_again == "No"
                    welcome
                    login
                end
                exit!
            end
        end
        if login_choice == "Sign Up"
            new_username = prompt.ask("Make a username.".light_yellow)
            new_password = prompt.ask("Make a password.".light_yellow)
            new_first_name = prompt.ask("What is your first name?".light_yellow)
            new_last_name = prompt.ask("What is your last name?".light_yellow)
            new_weight = prompt.ask("How much do you weigh(lbs)?".light_yellow)
            new_height = prompt.ask("How tall are you(inches)?".light_yellow)
            new_gender = prompt.ask("What is your gender?".light_yellow)
            new_BMI = prompt.ask("What is your BMI?".light_yellow)
            new_birth_year = prompt.ask("What year were you born?".light_yellow)
            User.create(user_name: new_username, password: new_password, first_name: new_first_name, last_name: new_last_name, weight: new_weight, height: new_height, gender: new_gender, BMI: new_BMI, birth_year: new_birth_year)
            puts "New account made!".green
            welcome
            login
        end
        if login_choice == "Exit"
            exit!
        end
end

welcome
login
