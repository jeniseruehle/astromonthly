class Horoscope < ApplicationRecord
    has_many :journals
    has_many :users, through: :journals
    belongs_to :month

    validates :sign, :content, presence: true

    scope :this_month, -> { where(created_at: Time.now.beginning_of_month..Time.now.end_of_month) }
end
