class Horoscope < ApplicationRecord
    has_many :journals
    has_many :users, through: :journals
    belongs_to :month

    validates :sign, :content, presence: true
end
