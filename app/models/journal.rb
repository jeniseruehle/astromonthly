class Journal < ApplicationRecord
    belongs_to :user
    belongs_to :horoscope

    validates :title, :description, :mood, presence: true
end
