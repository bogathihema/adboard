class AddEndDateTimeToAdboards < ActiveRecord::Migration[6.0]
  def change
    add_column :adboards, :end_date_time, :datetime
  end
end
