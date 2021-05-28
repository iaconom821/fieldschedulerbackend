class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.references :field, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.datetime :day
      t.integer :recommended_skill
      t.decimal :price

      t.timestamps
    end
  end
end
