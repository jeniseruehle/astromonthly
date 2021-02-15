class Month < ApplicationRecord
    has_many :horoscopes
    accepts_nested_attributes_for :horoscopes

    validates :name, presence: true
end
