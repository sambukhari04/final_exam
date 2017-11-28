class BidSerializer < ActiveModel::Serializer
  belongs_to :user
  attributes :id, :price, :user
end
