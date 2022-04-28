class AddPriceToAdboards < ActiveRecord::Migration[6.0]
  def change
    add_column :adboards, :price, :string
  end
end
