require 'pry'
class Workout < ActiveRecord::Base
    has_many :users_workouts
    has_many :users, :through => :user_workouts
    has_many :abs
    has_many :arms
    has_many :legs
    has_many :shoulders
    has_many :backs


    # def give_exercises
    #     abs_exercise = Workout.all.select{|object| self.abs_id == object.abs_id} 
    #     legs_exercise = Workout.all.select{|object| self.legs_id == object.legs_id}
    #     shoulders_exercise = Workout.all.select{|object| self.abs_id == object.shoulders_id}
    #     backs_exercise = Workout.all.select{|object| self.abs_id == object.abs_id}
    #     arms_exercise = Workout.all.select{|object| self.arms_id == object.arms_id}
    #     # abs_name = abs_exercise.map{|a|a.name}
    #     # abs_inten = abs_exercise.map{|a|a.intensity}
    #     # abs.dura = abs_exercise.map{|a|a.duration}
    #     binding.pry
    # #     # puts "hello"
    #     puts  "Your 7th grade gym teacher Mr.Willson is about to be so proud of you! This workout has an ab exercise called #{abs_exercise.name}, it is a #{abs_exercise.intensity} intensity exercise that lasts for #{ab_exercise.duration} minute(s). Let's get going!
    #     There is only one thing we say to skipping leg day. Not today. This workout is a leg exercise called #{legs_exercise.name}, it is a #{legs_exercise.intensity} intensity exercise that lasts for #{ab_exercise.duration} minute(s). Woof!
    #     It's about to be summer so we can't forget those shoulders. This workout is a shoulder exercise called #{shoulders_exercise.name}, it is a #{shoulders_exercise.intensity} intensity exercise that lasts for #{shoulders_exercise.duration}
    #     # Glad to see you back, and ready for more! This workout is a back exercise called #{backs_exercise.name}, it is a #{backs_exercise.intensity} intensity exercise that lasts for #{backs_exercise.new_duration}.
    #     This workout has an #{arms_exercise.name}, it is a #{arms_exercise.intensity} intensity exercise that lasts for #{ab_exercise.duration} minute(s)."
    #  end
 end

