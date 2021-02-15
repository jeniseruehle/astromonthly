class AddMonthToHoroscopes < ActiveRecord::Migration[6.0]
  def change
    add_reference :horoscopes, :month, null: false, foreign_key: true
  end
end
