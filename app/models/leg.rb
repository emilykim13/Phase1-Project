class Leg < ActiveRecord::Base
    belongs_to :workout


    def create_leg
        Leg.create(name, intensity, duration)
    end

    def give_leg_id
        self.id
    end
end