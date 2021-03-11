require_relative '../config/environment'

def welcome
title = Artii::Base.new(:font => "slant")
puts title.asciify("FULL BODY WORKOUT")
puts "Welcome to Full Body Workout CLI app, made by Emily and Robert! 
FBW is a CLI app that allows you to build a full body workout, save it to our gallery of workouts and access other users' 
workouts from the same gallery. Please login to continue or sign up to make an account! :)".magenta
end

def login 
    users = User.all.map {|user| user.user_name}
    prompt = TTY::Prompt.new
    login_choice = prompt.select("What would you like to do?".blue, ["Login", "Sign Up", "Exit"])
        if login_choice == "Login"
            current_username = prompt.ask("What is your username?".green)
            current_password = prompt.mask("Enter your password.".green)
            if users.include?(current_username) && User.all.find_by(password: current_password)
                header = Artii::Base.new(:font => "slant")
                puts header.asciify("Let's Workout!")
                menu
            else
                puts "Incorrect username or password.".red
                try_again = prompt.select("Would you like to try again?".blue, ["Yes", "No"])
                if try_again == "Yes"
                    login
                elsif try_again == "No"
                    welcome
                    login
                end
                
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

def intensity_options
    prompt = TTY::Prompt.new
    inten_opt = prompt.select("What is the intensity of this workout?".blue, ["Low", "Medium", "High"])
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

def select_from_gallery
    prompt_workouts = TTY::Prompt.new
        workouts = Workout.all
        workout_choice = prompt_workouts.select("Pick a workout.".blue) do |menu|
            workouts.each do |object|
                menu.choice "#{object.name}", object
            end
        end
        binding.pry
    puts "Great choice! This is a #{workout_choice.workout_type} workout.".blue
    prompt_start = TTY::Prompt.new
    start_workout = prompt_start.select("Would you like to start your selected workout?".blue, ["Yes", "No"])
    if start_workout == "Yes"
        x1 = workout_choice.abs_id
        x2 = workout_choice.arms_id
        x3 = workout_choice.legs_id
        x4 = workout_choice.shoulders_id
        x5 = workout_choice.backs_id
        #grabbing object by the id from above^
        abs_object = Ab.all.select{|object| object.id == x1}
        arms_object = Arm.all.select{|object| object.id == x2}
        legs_object = Leg.all.select{|object| object.id == x3}
        shoulders_object = Shoulder.all.select{|object| object.id == x4}
        backs_object = Back.all.select{|object| object.id == x5}
        #grabbing abs attributes by mapping
        abs_obj_name = abs_object.map{|object| object.name}
        abs_obj_intensity = abs_object.map{|object| object.intensity}
        abs_obj_duration = abs_object.map{|object| object.duration}
        #grabbing arms attributes by mapping
        arms_obj_name = arms_object.map{|object| object.name}
        arms_obj_intensity = arms_object.map{|object| object.intensity}
        arms_obj_duration = arms_object.map{|object| object.duration}
        #grabbing legs attributes by mapping
        legs_obj_name = legs_object.map{|object| object.name}
        legs_obj_intensity = legs_object.map{|object| object.intensity}
        legs_obj_duration = legs_object.map{|object| object.duration}
        #grabbing shoulders attributes by mapping
        shoulders_obj_name = shoulders_object.map{|object| object.name}
        shoulders_obj_intensity = shoulders_object.map{|object| object.intensity}
        shoulders_obj_duration = shoulders_object.map{|object| object.duration}
        #grabbing backs attributes by mapping
        backs_obj_name = backs_object.map{|object| object.name}
        backs_obj_intensity = backs_object.map{|object| object.intensity}
        backs_obj_duration = backs_object.map{|object| object.duration}

        x_prompt = TTY::Prompt.new
        puts_prompt = x_prompt.select("How would you like your workout presented?".blue, ["An awesome message from your 7th grade gym teacher", "Just give me the exercises"])
        if puts_prompt == "An awesome message from your 7th grade gym teacher"
        puts  "Your 7th grade gym teacher Mr.Willson is about to be so proud of you! This workout has an ab exercise called #{abs_obj_name}, it is a #{abs_obj_intensity} intensity exercise that lasts for #{abs_obj_duration} minute(s). 
        This workout has an #{arms_obj_name}, it is a #{arms_obj_intensity} intensity exercise that lasts for #{arms_obj_duration} minute(s). Let's get going! 
        There is only one thing we say to skipping leg day. Not today. This workout is a leg exercise called #{legs_obj_name}, it is a #{legs_obj_intensity} intensity exercise that lasts for #{legs_obj_duration} minute(s). Woof!
        It's about to be summer so we can't forget those shoulders. This workout is a shoulder exercise called #{shoulders_obj_name}, it is a #{shoulders_obj_intensity} intensity exercise that lasts for #{shoulders_obj_duration} minute(s).
        Glad to see you back, and ready for more! This workout is a back exercise called #{backs_obj_name}, it is a #{backs_obj_intensity} intensity exercise that lasts for #{backs_obj_duration} minute(s).".magenta
        menu
        elsif puts_prompt == "Just give me the exercises"
        puts "You have an ab exercise called #{abs_obj_name} that is a #{abs_obj_intensity} intensity level exercise, do this for #{abs_obj_duration} minute(s).".magenta
        puts "You have an arm exercise called #{arms_obj_name} that is a #{arms_obj_intensity} intensity level exercise, do this for #{arms_obj_duration} minute(s).".magenta
        puts "You have a leg exercise called #{legs_obj_name} that is a #{legs_obj_intensity} intensity level exercise, do this for #{legs_obj_duration} minute(s).".magenta
        puts "You have a shoulder exercise called #{shoulders_obj_name} that is a #{shoulders_obj_intensity} intensity level exercise, do this for #{shoulders_obj_duration} minute(s).".magenta
        puts "You have a back exercise called #{backs_obj_name} that is a #{backs_obj_intensity} intensity level exercise, do this for #{backs_obj_duration} minute(s).".magenta
        menu
        end
    elsif start_workout == "No"
        menu
    end
end

def workout_type_options
    prompt = TTY::Prompt.new
    type_opt = prompt.select("What type of workout is this?".blue, ["HIIT", "Resistance Training", "Cardio", "Flexibility"])
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

def look_at_profile
    profile_users = User.all.map{|user| user.user_name}
    prompt = TTY::Prompt.new
    profile_choice = prompt.select("Which would you like to do?".blue, ["Check out my current profile", "Update my profile", "Go back to menu"])
        if profile_choice == "Check out my current profile"
            username_profile = prompt.ask("Please enter your username:")
            password_profile = prompt.mask("Please enter your password:")
            if profile_users.include?(username_profile) && User.all.find_by(password: password_profile)
            profile_user = User.all.find_by(user_name: username_profile)
            puts "Username: #{profile_user.user_name}".yellow
            puts "First name: #{profile_user.first_name}".yellow
            puts "Last name: #{profile_user.last_name}".yellow
            puts "Weight: #{profile_user.weight} lbs".yellow
            puts "Height: #{profile_user.height} inches".yellow
            puts "Gender: #{profile_user.gender}".yellow
            puts "BMI: #{profile_user.BMI}".yellow
            puts "Birth year: #{profile_user.birth_year}".yellow
            menu
            end
        elsif profile_choice == "Update my profile"
            username_update_profile = prompt.ask("Please enter your username to update profile:")
            if profile_users.include?(username_update_profile)
            update_user = User.all.find_by(user_name: username_update_profile)
            update_choice = prompt.select("Please select what you want to update:".blue, ["My first name", "My last name", "My weight", "My height", "My BMI", "My gender", "Go back to menu"])
                if update_choice == "My first name"
                    profile_new_name = prompt.ask("Update first name:")
                    update_user.update(first_name: profile_new_name)
                    puts "Your first name has been updated.".green
                    menu
                elsif update_choice == "My last name"
                    profile_new_last = prompt.ask("Update last name:")
                    update_user.update(last_name: profile_new_last)
                    puts "Your last name has been updated.".green
                    menu
                elsif update_choice == "My weight"
                    profile_new_weight = prompt.ask("Update weight (lbs):")
                    update_user.update(weight: profile_new_name)
                    puts "Your weight has been updated.".green
                    menu
                elsif update_choice == "My height"
                    profile_new_height = prompt.ask("Update height (inches):")
                    update_user.update(height: profile_new_name)
                    puts "Your height has been updated.".green
                    menu
                elsif update_choice == "My BMI"
                    profile_new_bmi = prompt.ask("Update body mass index:")
                    update_user.update(BMI: profile_new_bmi)
                    puts "Your body mass index has been updated.".green
                    menu
                elsif update_choice == "My gender"
                    profile_new_gender = prompt.ask("Update gender:")
                    update_user.update(gender: profile_new_gender)
                    puts "Your gender has been updated.".green
                    menu
                elsif update_choice == "Go back to menu"
                    puts "Returning back to menu.".yellow
                    menu
                end
            end
        elsif  profile_choice == "Go back to menu"
            puts "Returning back to menu.".yellow
            menu
        end
end

def delete_account
    users = User.all.map {|user| user.user_name}
    prompt = TTY::Prompt.new
    sure = prompt.select("Are you sure you want to delete your account?".red, ["Yes", "No"])
    if sure == "Yes"
        enter_username = prompt.ask("Please enter your username to continue:".yellow)
        enter_password = prompt.mask("Please enter your password:".yellow)
        if users.include?(enter_username) && User.all.find_by(password: enter_password)
        account = User.all.select{|object| object.user_name == enter_username}
        account_id = account.map{|id| id.id}
        User.destroy(account_id)
        puts "Account deleted, returning to main menu.".yellow
        welcome
        login
        end
    elsif sure == "No"
        menu
    end
end

def change_username
    my_users = User.all.map{|use| use.user_name}
    prompt = TTY::Prompt.new
    you_sure = prompt.select("Are you sure you want to change your username?".blue, ["Yes", "No"])
    if you_sure == "Yes"
        your_username = prompt.ask("Please enter your usename to continue:")
        your_password = prompt.mask("Please enter your password:")
        if my_users.include?(your_username) && User.all.find_by(password: your_password)
            your_confirm_password = prompt.mask("Please confirm your password:")
            if your_password == your_confirm_password
                new_username = prompt.ask("Please enter new username:")
                new_username_confirm = prompt.ask("Please confirm your new username:")
                if new_username == new_username_confirm
                x_user = User.all.find_by(user_name: your_username)
                x_user.update(user_name: new_username)
                puts "Your username is now changed.".light_yellow
                welcome
                login
                end
            else 
                puts "Usernames do not match."
            end
        else 
            puts "Incorrect username or password."
            menu
        end
    elsif you_sure == "No"
        menu
    end
end
def change_password
    my_users = User.all.map{|use| use.user_name}
    prompt = TTY::Prompt.new
    you_sure = prompt.select("Are you sure you want to change your password?".blue, ["Yes", "No"])
    if you_sure == "Yes"
        your_username = prompt.ask("Please enter your usename to continue:")
        your_password = prompt.mask("Please enter your password:")
        if my_users.include?(your_username) && User.all.find_by(password: your_password)
            your_confirm_password = prompt.mask("Please confirm your password:")
            if your_password == your_confirm_password
                new_password = prompt.ask("Please enter new password:")
                new_password_confirm = prompt.ask("Please confirm your new password:")
                if new_password == new_password_confirm
                x_user = User.all.find_by(password: your_password)
                x_user.update(password: new_password)
                puts "Your password is now changed.".light_yellow
                welcome
                login
                end
            else 
                puts "Passwords do not match."
            end
        else 
            puts "Incorrect username or password."
            menu
        end
    elsif you_sure == "No"
        menu
    end
end

def menu
    options = TTY::Prompt.new
    menu_choice = options.select("What would you like to do?", ["Start a new workout", "Look at my account details", "Exit app"])
        if menu_choice == "Start a new workout"
            a_new_workout = TTY::Prompt.new
            build_or_start = a_new_workout.select("Do you want to select from our workouts gallery or make a new workout?".blue, ["Select from gallery", "Make a new workout", "Go back to menu"])
            if build_or_start == "Select from gallery"
                select_from_gallery
            elsif build_or_start == "Make a new workout"
                make_new_workout
            elsif build_or_start == "Go back to menu"
                menu
            end
        elsif menu_choice == "Look at my account details"
            a_prompt = TTY::Prompt.new
            account_prompt = a_prompt.select("What do you want to do?".blue, ["Look at my profile", "Change my username", "Change my password", "Delete my account", "Go back to menu"])
                if account_prompt == "Look at my profile"
                    look_at_profile
                elsif account_prompt == "Change my username"
                    change_username
                elsif account_prompt == "Change my password"
                    change_password
                elsif account_prompt == "Delete my account"
                    delete_account
                elsif account_prompt == "Go back to menu"
                    menu
                end
        elsif menu_choice == "Exit"
            exit!
        end
end

welcome
login

