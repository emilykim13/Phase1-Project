class CreateUsers < ActiveRecord::Migration[6.1]

  def change
    create_tables :users do |t| 
      t.string :user_name
      t.string :first_name
      t.string :last_name
      t.integer :weight
      t.float :height
      t.string :gender
      t.integer :BMI
      t.integer :age
  end
end

def change
  create_tables :workouts do |t|
    t.string
end
