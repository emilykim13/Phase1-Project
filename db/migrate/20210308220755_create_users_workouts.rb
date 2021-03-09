class CreateUsersWorkouts < ActiveRecord::Migration[6.1]
  def change
    create_table :users_workouts do |t|
      t.string :name
      t.integer :users_id
      t.integer :workouts_id
      t.integer :total_duration
      t.string :favorites
      t.integer :date
    end
  end
end
