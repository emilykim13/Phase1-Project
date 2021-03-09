class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t| 
      t.string :user_name
      t.string :password
      t.string :first_name
      t.string :last_name
      t.integer :weight
      t.float :height
      t.string :gender
      t.integer :BMI
      t.integer :birth_year
    end
  end
end