class User < ActiveRecord::Base
    has_many :users_workouts
    has_many :workouts, :through => :users_workouts

    # def delete_account
    #     users = User.all.map {|user| user.user_name}
    #     prompt = TTY::Prompt.new
    #     sure = prompt.ask("Are you sure you want to delete your account?" ["Yes", "No"])
    #     if sure == "Yes"
    #         enter_username = prompt.ask("Please enter your username to continue:".yellow)
    #         enter_password = prompt.mask("Please enter your password:".yellow)
    #         if users.include?(enter_username) && User.all.find_by(password: current_password)
    #         account = Users.all.select{|object| object.user_name == enter_username} # User.id
    #         account.destroy
    #         puts "Account deleted, returning to main menu."
    #         welcome
    #         login
    #         end

    #     elsif sure == "No"
    #         menu
    #     end
    #     # login
    # end

end