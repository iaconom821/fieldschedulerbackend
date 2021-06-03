class RemoveDayFromGames < ActiveRecord::Migration[6.1]
  def change
    remove_column :games, :day, :datetime
  end
end
