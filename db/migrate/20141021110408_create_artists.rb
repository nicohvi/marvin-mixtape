class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string      :spotify_id
      t.string      :name
      t.references  :mixtape

      t.timestamps
    end
  end
end
