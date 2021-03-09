class User < ActiveRecord::Base
    has_many :users_workout
    has_many :workout, :through => :users_workout
end