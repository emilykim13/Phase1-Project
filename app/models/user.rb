class User < ActiveRecord::Base
    has_many :users_workouts
    has_many :workouts, :through => :users_workouts
end