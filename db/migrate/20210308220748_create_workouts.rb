class CreateWorkouts < ActiveRecord::Migration[6.1]
  def change
    create_tables :workouts do |t|
      t.string :name
      t.string :type
      # t.string :estimated_duration dont tihnk we need this one
      t.integer :abs_id
      t.integer :arms_id
      t.integer :legs_id
      t.integer :shoulders_id
      t.integer :back_id
    end
  end
end
