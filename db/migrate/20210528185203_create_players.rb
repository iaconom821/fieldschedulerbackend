class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :age
      t.integer :skill_level
      t.string :username

      t.timestamps
    end
  end
end
