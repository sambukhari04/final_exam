class User < ApplicationRecord
  has_secure_password
  before_create :generate_api_key
  has_many :bids
  has_many :auctions

  private
  def generate_api_key
    loop do
      self.api_key = SecureRandom.urlsafe_base64(64)
      break unless User.exists?(api_key: self.api_key)
    end
  end

end
