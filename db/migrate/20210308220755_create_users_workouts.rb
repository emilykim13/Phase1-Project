class CreateUsersWorkouts < ActiveRecord::Migration[6.1]
  def change
    create_tables :users_workouts do |t|
      t.string :name

      
  end
end
