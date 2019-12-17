class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.string :url
      t.string :suggested_by
      t.integer :votes

      t.timestamps
    end
  end
end
