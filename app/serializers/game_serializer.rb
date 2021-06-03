class GameSerializer < ActiveModel::Serializer
  attributes :id, :start_time, :end_time, :recommended_skill, :price
  has_one :field
  has_one :player_id
end
