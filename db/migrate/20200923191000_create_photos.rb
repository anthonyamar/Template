class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :url, null: false
      t.integer :label, null: false, default: 0
      t.timestamps
    end
  end
end
