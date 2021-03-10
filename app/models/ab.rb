class Ab < ActiveRecord::Base
    belongs_to :workout

    def give_ab_id
        self.id
    end
end