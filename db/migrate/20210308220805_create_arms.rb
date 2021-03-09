class CreateArms < ActiveRecord::Migration[6.1]
  def change
    create_table :arms do |t|
      t.string :name
      t.string :intensity
      t.integer :duration
    end
  end
end
