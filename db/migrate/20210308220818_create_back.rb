class CreateBack < ActiveRecord::Migration[6.1]
  def change
    create_table :backs do |t|
      t.string :name
      t.string :intensity
      t.integer :duration
    end
  end
end
# binding.pry