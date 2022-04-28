class AddStartDateTimeToAdboards < ActiveRecord::Migration[6.0]
  def change
    add_column :adboards, :start_date_time, :datetime
  end
end
