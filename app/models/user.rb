class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true
    validates :email, uniqueness: true, presence: true

    has_many :journals
    has_many :horoscopes, through: :journals
end
