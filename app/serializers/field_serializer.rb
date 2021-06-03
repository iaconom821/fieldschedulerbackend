class FieldSerializer < ActiveModel::Serializer
  attributes :id, :address, :size, :img_url, :name
  has_many :games
end
