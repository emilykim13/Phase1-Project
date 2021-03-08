class CreateArms < ActiveRecord::Migration[6.1]
  def change
    create_tables :arms do |t|
      t.string :name
      t.string :intensity
      t.integer :duration
    end
  end
end
