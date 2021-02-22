class Journal < ApplicationRecord
    belongs_to :user
    belongs_to :horoscope

    validates :title, :description, :mood, presence: true

    scope :most_recent, -> {limit(10).order('created_at DESC')}
end
