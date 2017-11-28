class AddApiKeyToAuctions < ActiveRecord::Migration[5.1]
  def change
    add_column :auctions, :api_key, :string
    add_index :auctions, :api_key, unique: true
  end
end
