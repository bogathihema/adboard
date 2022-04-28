class CreateAdboards < ActiveRecord::Migration[6.0]
  def change
    create_table :adboards do |t|
      t.integer :size_n
      t.integer :size_m
      t.string :color
      t.integer :time_in_hours

      t.timestamps
    end
  end
end
