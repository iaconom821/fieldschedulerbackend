class Game < ApplicationRecord
  belongs_to :field_id
  belongs_to :player_id
  has_many :slots
  has_many :players, through: :slots
end
