class Shoulder < ActiveRecord::Base
    belongs_to :workout
    

    def create_shoulder
        Shoulder.create(name, intensity, duration)
    end

    def give_shoulder_id
        self.id
    end
end

# "Hi here are your exercise. This workout has an ab exercise called #{ab_exercise.name} it is an #{ab_exercise.intensity} intensity exercise that lasts for #{ab_exercise.duration} minute(s)."