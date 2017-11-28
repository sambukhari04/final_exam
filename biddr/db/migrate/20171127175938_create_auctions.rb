class CreateAuctions < ActiveRecord::Migration[5.1]
  def change
    create_table :auctions do |t|
      t.string :title
      t.text :details
      t.date :end_date
      t.float :price

      t.timestamps
    end
  end
end
