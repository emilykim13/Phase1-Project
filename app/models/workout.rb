class Workout < ActiveRecord::Base
    has_many :users_workout
    has_many :users, :through => :user_workout
end
