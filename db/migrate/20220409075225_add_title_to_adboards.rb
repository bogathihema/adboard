class AddTitleToAdboards < ActiveRecord::Migration[6.0]
  def change
    add_column :adboards, :title, :string
  end
end
