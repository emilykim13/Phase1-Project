require 'pry'
class Arm < ActiveRecord::Base
    belongs_to :workout

    def create_arm
        Arm.create(name, intensity, duration)
    end
# binding.pry
    def return_arm_object
        Arm.all.select{|object| object.id == self.id}
    end

end