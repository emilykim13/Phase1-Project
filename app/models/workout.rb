class Workout < ActiveRecord::Base
    has_many :users_workouts
    has_many :users, :through => :user_workouts
end
