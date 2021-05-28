class CreateFields < ActiveRecord::Migration[6.1]
  def change
    create_table :fields do |t|
      t.string :address
      t.string :size
      t.string :img_url

      t.timestamps
    end
  end
end
