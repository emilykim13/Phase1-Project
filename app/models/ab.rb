require 'pry'

class Ab < ActiveRecord::Base
    belongs_to :workout

def give_exercises
end

end



# def give_exercises
    # returns ab object
    # returns arm object
    # returns leg object
    # returns shoulder object
    # returns back object
# end
# create_table :workouts do |t|
#     t.string :name
#     t.string :workout_type
#     t.integer :abs_id
#     t.integer :arms_id
#     t.integer :legs_id
#     t.integer :shoulders_id
#     t.integer :backs_id