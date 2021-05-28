class Game < ApplicationRecord
  belongs_to :field_id
  belongs_to :player_id
end
