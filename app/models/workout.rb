class Workout < ActiveRecord::Base
    has_many :users_workouts
    has_many :users, :through => :user_workouts
    

    def give_exercises
       abs_exercise = all.select{|object| self.abs_id == object.abs_id} 
       legs_exercise = all.select{|object| self.legs_id == object.legs_id}
       shoulders_exercise = all.select{|object| self.abs_id == object.shoulder_id}
       backs_exercise = all.select{|object| self.abs_id == object.abs_id}
    end

end



"Your 7th grade gym teacher Mr.Willson is about to be so proud of you! This workout has an ab exercise called #{abs_exercise.name}, it is a #{abs_exercise.intensity} intensity exercise that lasts for #{ab_exercise.duration} minute(s). Let's get going!"
"There is only one thing we say to skipping leg day. Not today. This workout is a leg exercise called #{legs_exercise.name}, it is a #{legs_exercise.intensity} intensity exercise that lasts for #{ab_exercise.duration} minute(s). Woof!"
"It's about to be summer so we can't forget those shoulders. This workout is a shoulder exercise called #{shoulders_exercise.name}, it is a #{shoulders_exercise.intensity} intensity exercise that lasts for #{shoulders_exercise.duration}"
"Glad to see you back, and ready for more! This workout is a back exercise called #{backs_exercise.name}, it is a #{backs_exercise.intensity} intensity exercise that lasts for #{backs_exercise.new_duration}".