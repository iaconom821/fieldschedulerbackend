class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :skill_level, :username
end
