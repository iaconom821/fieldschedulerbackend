class Game < ApplicationRecord
  belongs_to :field
  belongs_to :player
  has_many :slots
  has_many :players, through: :slots
end
