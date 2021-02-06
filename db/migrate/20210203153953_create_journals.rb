class CreateJournals < ActiveRecord::Migration[6.0]
  def change
    create_table :journals do |t|
      t.string :title
      t.string :description
      t.string :mood
      t.belongs_to :user, foreign_key: true
      t.belongs_to :horoscope, foreign_key: true

      t.timestamps
    end
  end
end
