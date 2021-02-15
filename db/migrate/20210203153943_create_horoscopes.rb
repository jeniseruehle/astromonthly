class CreateHoroscopes < ActiveRecord::Migration[6.0]
  def change
    create_table :horoscopes do |t|
      t.string :sign
      t.string :content

      t.timestamps
    end
  end
end
