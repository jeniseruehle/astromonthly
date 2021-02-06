class Journal < ApplicationRecord
    belongs_to :user
    belongs_to :horoscope

    validates :title, presence: true
    validates :description, presence: true
    validates :mood, presence: true
end
