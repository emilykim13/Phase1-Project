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
            current_password = prompt.mask("Enter your password.".green)
            if users.include?(current_username) && User.all.find_by(password: current_password)
                puts "Let's Workout!"
            else
                puts "Incorrect username or password.".red
                login_try_again = TTY::Prompt.new
                try_again = login_try_again.select("Would you like to try again?".light_yellow, ["Yes", "No"])
                if try_again == "Yes"
                    current_username = prompt.ask("What is your username?").light_yellow
                    current_password = prompt.mask("Enter your password.").light_yellow
                    if users.include?(current_username) && User.all.find_by(password: current_password)
                        puts "Let's Workout!"
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
# the 5 one to many models
# >>>>>>>>>
def new_abs
    prompt = TTY::Prompt.new
    new_name = prompt.ask("Name of this ab exercise:".blue)
    new_intensity = prompt.ask("Is this low, medium or high intensity?".blue)
    new_duration = prompt.ask("What is the duration of this exercise in minute(s)?".blue)
    Ab.create(name: new_name, intensity: new_intensity, duration: new_duration.to_f)
end
def new_arms
    prompt = TTY::Prompt.new
    new_name = prompt.ask("Name of this ab exercise:".blue)
    new_intensity = prompt.ask("Is this low, medium or high intensity?".blue)
    new_duration = prompt.ask("What is the duration of this exercise in minute(s)?".blue)
    Arm.create(name: new_name, intensity: new_intensity, duration: new_duration.to_f)
end
def new_legs
    prompt = TTY::Prompt.new
    new_name = prompt.ask("Name of this ab exercise:".blue)
    new_intensity = prompt.ask("Is this low, medium or high intensity?".blue)
    new_duration = prompt.ask("What is the duration of this exercise in minute(s)?".blue)
    Leg.create(name: new_name, intensity: new_intensity, duration: new_duration.to_f)
end
def new_shoulders
    prompt = TTY::Prompt.new
    new_name = prompt.ask("Name of this ab exercise:".blue)
    new_intensity = prompt.ask("Is this low, medium or high intensity?".blue)
    new_duration = prompt.ask("What is the duration of this exercise in minute(s)?".blue)
    Shoulder.create(name: new_name, intensity: new_intensity, duration: new_duration.to_f)
end
def new_backs
    prompt = TTY::Prompt.new
    new_name = prompt.ask("Name of this ab exercise:".blue)
    new_intensity = prompt.ask("Is this low, medium or high intensity?".blue)
    new_duration = prompt.ask("What is the duration of this exercise in minute(s)?".blue)
    Back.create(name: new_name, intensity: new_intensity, duration: new_duration.to_f)
end
# >>>>>>>

def select_from_gallery
    prompt_workouts = TTY::Prompt.new
        workouts = Workout.all
        workout_choice = prompt_workouts.select("Pick a workout.") do |menu|
            workouts.each do |object|
                menu.choice "#{object.name}", object.id   
            end
        end
end

def make_new_workout
    prompt = TTY::Prompt.new
    puts "Put your workout together!"
    new_name = prompt.ask("Name this workout:".blue)
    new_workout_type = prompt.select("What type of workout is this?" ["HIIT", "Resistance Training", "Cardio", "Flexibility"])
    # new_abs_id = 
    # new_arms_id = 
    # new_legs_id = 
    # new_shoulders_id = 
    # new_backs_id = 
    ###
end

def look_past_workouts
    UsersWorkout.all.select{|object| object.id == users_workout.users_id}
end

def delete_account
    prompt = TTY::Prompt.new
    sure = prompt.ask("Are you sure you want to delete your account?" ["Yes", "No"])
    if sure = "Yes"
        word = Users.all.find{|object| object.user_name} # User.id
        word.destroy
        puts "Account deleted."
    elsif sure = "No"
        menu # this should return it to menu
    end
end

def menu
    options = TTY::Prompt.new
    menu_choice = options.select("What would you like to do?", ["Start a new workout", "Look at my past workouts", "Look at my account details"])
        if menu_choice == "Start a new workout"
            a_new_workout = TTY::Prompt.new
            build_or_start = a_new_workout.select("Do you want to select from our workouts gallery or make a new workout?", ["Select from gallery", "Make a new workout"])
            if build_or_start == "Select from gallery"
                select_from_gallery # incomplete; does not give object id
            elsif build_or_start == "Make a new workout"
                make_new_workout #incomplete; does not have method for one to many models for .create
            end
        elsif menu_choice == "Look at my past workouts"
            # look_past_workouts 
            # past 10 workouts
            puts "coding in-progress..."
        elsif menu_choice = "Look at my account details"
            a_prompt = TTY::Prompt.new
            account_prompt = a_prompt.select("What do you want to do?", ["Look at my total workouts", "Change my username", "Change my password", "Delete my account", "Go back to menu"])
                if account_prompt == "Look at my total workouts"
                    # user.total_workouts <-- make a method
                elsif account_prompt == "Change my username"
                    # Enter password, if correct, enter new username, save
                elsif account_prompt == "Change my password"
                    # Enter password, if correct, enter new password, save
                elsif account_prompt == "Delete my account"
                    delete_account # (method is progres) broken logic
                elsif account_prompt == "Go back to menu"
                    menu
                end
                
        end
end
# binding.pry

welcome
login
menu
