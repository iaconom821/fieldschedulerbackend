class FieldSerializer < ActiveModel::Serializer
  attributes :id, :address, :size, :img_url
  has_many :games
end
