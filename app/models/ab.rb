class Ab < ActiveRecord::Base
    belongs_to :workout


    # def create_ab
    #     Ab.create(name, intensity, duration)
    # end

    def give_ab_id
        self.id
    end
end