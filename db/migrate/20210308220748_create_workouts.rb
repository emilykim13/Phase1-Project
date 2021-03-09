class CreateWorkouts < ActiveRecord::Migration[6.1]
  def change
    create_table :workouts do |t|
      t.string :name
      t.string :type
      t.integer :abs_id
      t.integer :arms_id
      t.integer :legs_id
      t.integer :shoulders_id
      t.integer :backs_id
    end
  end
end
