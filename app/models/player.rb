class Player < ApplicationRecord
    has_many :games
    has_many :slots
    has_many :fields, through: :games
    has_secure_password
end
