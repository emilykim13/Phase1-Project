class Back < ActiveRecord::Base
    belongs_to :workout


    def create_back
        Back.create(name, intensity, duration)
    end

    def give_back_id
        self.id
    end
end