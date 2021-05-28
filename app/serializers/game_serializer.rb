class GameSerializer < ActiveModel::Serializer
  attributes :id, :start_time, :end_time, :day, :recommended_skill, :price
  has_one :field_id
  has_one :player_id
end
