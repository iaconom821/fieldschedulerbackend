class SlotSerializer < ActiveModel::Serializer
  attributes :id, :price
  has_one :player
  has_one :game
end
