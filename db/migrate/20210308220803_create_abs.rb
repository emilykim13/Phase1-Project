class CreateAbs < ActiveRecord::Migration[6.1]
  def change
    create_tables :abs do |t|
      t.string :name
      t.string :intensity
      t.integer :duration 
    end

  end
end
