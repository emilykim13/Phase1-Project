class Workout < ActiveRecord::Base
    has_many :users_workouts
    has_many :users, :through => :user_workouts
    has_many :abs
    has_many :arms
    has_many :legs
    has_many :shoulders
    has_many :backs
end
