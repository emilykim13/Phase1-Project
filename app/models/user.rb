class User < ActiveRecord::Base
    has_many :users_workouts
    has_many :workouts, :through => :users_workouts

# def changepassword(new_password)
#     self.password = new_pw
# end


end