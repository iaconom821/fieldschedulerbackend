class Player < ApplicationRecord
    has_many :games
    has_many :slots
    has_many :fields, through: :games
    has_secure_password

    validates :name, presence: true
    validates :age, presence: true
    validates :username, presence: true
    validates :password_digest, presence: true

    validates :skill_level, numericality: { greater_than: 0, less_than: 11, message: "Skill Level Between 1 and 10 only" }
end
