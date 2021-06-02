class CreateSlots < ActiveRecord::Migration[6.1]
  def change
    create_table :slots do |t|
      t.belongs_to :player, null: false, foreign_key: true
      t.belongs_to :game, null: false, foreign_key: true
      t.float :price

      t.timestamps
    end
  end
end
