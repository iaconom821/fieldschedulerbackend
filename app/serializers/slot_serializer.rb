class SlotSerializer < ActiveModel::Serializer
  attributes :id, :price, :player_id, :game_id
end
