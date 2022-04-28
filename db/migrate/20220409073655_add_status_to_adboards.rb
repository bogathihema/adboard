class AddStatusToAdboards < ActiveRecord::Migration[6.0]
  def change
    add_column :adboards, :status, :string
  end
end
