class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :name
      t.date_time :watched_at
      t.integer :watch_time

      t.timestamps
    end
  end
end
