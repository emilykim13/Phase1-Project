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
def intensity_options #method for make_new_workout/new_models
    prompt = TTY::Prompt.new
    inten_opt = prompt.select("What is the intensity of this workout?", ["Low", "Medium", "High"])
    if inten_opt == "Low"
        set_intensity = "low"
    elsif inten_opt == "Medium"
        set_intensity = "medium"
    elsif inten_opt == "High"
        set_intensity = "high"
    end
    set_intensity
end
def new_abs
    prompt = TTY::Prompt.new
    new_name = prompt.ask("Name of this ab exercise:".blue)
    new_intensity = intensity_options
    new_duration = prompt.ask("What is the duration of this exercise in minute(s)?".blue)
    new_ab = Ab.create(name: new_name, intensity: new_intensity, duration: new_duration.to_f)
    return new_ab
end
def new_arms
    prompt = TTY::Prompt.new
    new_name = prompt.ask("Name of this arm exercise:".blue)
    new_intensity = intensity_options
    new_duration = prompt.ask("What is the duration of this exercise in minute(s)?".blue)
    new_arm = Arm.create(name: new_name, intensity: new_intensity, duration: new_duration.to_f)
    return new_arm
end
def new_legs
    prompt = TTY::Prompt.new
    new_name = prompt.ask("Name of this leg exercise:".blue)
    new_intensity = intensity_options
    new_duration = prompt.ask("What is the duration of this exercise in minute(s)?".blue)
    new_leg = Leg.create(name: new_name, intensity: new_intensity, duration: new_duration.to_f)
    return new_leg
end
def new_shoulders
    prompt = TTY::Prompt.new
    new_name = prompt.ask("Name of this shoulder exercise:".blue)
    new_intensity = intensity_options
    new_duration = prompt.ask("What is the duration of this exercise in minute(s)?".blue)
    new_shoulder = Shoulder.create(name: new_name, intensity: new_intensity, duration: new_duration.to_f)
    return new_shoulder
end
def new_backs
    prompt = TTY::Prompt.new
    new_name = prompt.ask("Name of this back exercise:".blue)
    new_intensity = intensity_options
    new_duration = prompt.ask("What is the duration of this exercise in minute(s)?".blue)
    new_back = Back.create(name: new_name, intensity: new_intensity, duration: new_duration.to_f)
    return new_back
end

#>>>>

# >>>>>>>
# >>>>>>> "Start a new workout"

def select_from_gallery
    prompt_workouts = TTY::Prompt.new
        workouts = Workout.all
        workout_choice = prompt_workouts.select("Pick a workout.") do |menu|
            workouts.each do |object|
                menu.choice "#{object.name}", object
            end
        end
        puts workout_choice.id # return exercise method
        menu
end

def workout_type_options #method for make_new_workout
    prompt = TTY::Prompt.new
    type_opt = prompt.select("What type of workout is this?", ["HIIT", "Resistance Training", "Cardio", "Flexibility"])
    if type_opt == "HIIT"
        set_type = "HIIT"
    elsif type_opt == "Resistance Training"
        set_type = "Resistance Training"
    elsif type_opt == "Cardio"
        set_type = "Cardio"
    elsif type_opt == "Flexibility"
        set_type = "Flexibility"
    end
    set_type
end

def make_new_workout
    prompt = TTY::Prompt.new
    puts "Put your workout together!"
    new_name = prompt.ask("Name this workout:".blue)
    new_workout_type = workout_type_options
    abs = new_abs
    # binding.pry
    arms = new_arms
    legs = new_legs
    shoulders = new_shoulders
    backs = new_backs
    new_abs_id = abs.id
    new_arms_id = arms.id
    new_legs_id = legs.id
    new_shoulders_id = shoulders.id
    new_backs_id = backs.id
    Workout.create(name: new_name, workout_type: new_workout_type, abs_id: new_abs_id, arms_id: new_arms_id, legs_id: new_legs_id, shoulders_id: new_shoulders_id, backs_id: new_backs_id)
    puts "Your new workout has been added to workout gallery!".magenta
    menu
end

def look_past_workouts
    menu
end
# >>>>>>>
# >>>>>>> "Look at my past workouts" consider a leaderboard instead? whatever makes more sense and is doable

# >>>>>>> "Look at my account details"
def delete_account
    users = User.all.map {|user| user.user_name} # setting new array of just user_names
    prompt = TTY::Prompt.new
    sure = prompt.select("Are you sure you want to delete your account?".red, ["Yes", "No"])
    if sure == "Yes"                     # argument 1 ^                  ,   argument 2^
        enter_username = prompt.ask("Please enter your username to continue:".yellow)
        enter_password = prompt.mask("Please enter your password:".yellow)
        if users.include?(enter_username) && User.all.find_by(password: enter_password)
        account = User.all.select{|object| object.user_name == enter_username} #find the whole object by the the username given from enter_username
        # binding.pry
        account_id = account.map{|id| id.id} #modify the array to give back just the id
        # binding.pry
        User.destroy(account_id) #stopped here user.find_by user.id = user.id
        # .destroy REQUIRES an integer id
        puts "Account deleted, returning to main menu.".yellow
        welcome
        login
        end
    elsif sure == "No"
        menu
    end
end
# >>>>>>>

def menu
    options = TTY::Prompt.new
    menu_choice = options.select("What would you like to do?", ["Start a new workout", "Look at my past workouts", "Look at my account details"])
        if menu_choice == "Start a new workout"
            a_new_workout = TTY::Prompt.new
            build_or_start = a_new_workout.select("Do you want to select from our workouts gallery or make a new workout?", ["Select from gallery", "Make a new workout", "Go back to menu"])
            if build_or_start == "Select from gallery"
                select_from_gallery # incomplete; does not give object id; line 92
            elsif build_or_start == "Make a new workout"
                make_new_workout
            elsif build_or_start == "Go back to menu"
                menu
            end
        elsif menu_choice == "Look at my past workouts"
            # look_past_workouts 
            # past 10 workouts
            puts "coding in-progress..."
        elsif menu_choice = "Look at my account details" #stretch goals
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
