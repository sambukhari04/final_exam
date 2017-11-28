class Auction < ApplicationRecord
  before_create :generate_api_key
  belongs_to :user
  has_many :bids

  validates(:title, {
      presence: true,
      length: {minimum: 5, maximum: 2000}
    })
  validates(:details, {
      presence: true,
      length: {minimum: 5, maximum: 2000}
    })
  validates(:end_date, {
      presence: true
    })
  validates(:price, numericality: {
        greater_than: 0
    })

  private

  def generate_api_key
    self.api_key = SecureRandom.urlsafe_base64(64)
  end

end
