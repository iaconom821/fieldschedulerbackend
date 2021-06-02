class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :skill_level, :username
  has_many :games
  has_many :slots
end
