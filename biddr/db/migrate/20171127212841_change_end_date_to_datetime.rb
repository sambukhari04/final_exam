class ChangeEndDateToDatetime < ActiveRecord::Migration[5.1]
  def change
    change_column :auctions, :end_date, :datetime
  end
end
