class Leg < ActiveRecord::Base
    belongs_to :workout


    def create_leg
        Leg.create(name, intensity, duration)
    end

end