class CreateAtricles < ActiveRecord::Migration[6.0]
  def change
    create_table :atricles do |t|
      t.string :title
      t.text :body
      t.boolean :published

      t.timestamps
    end
  end
end
