class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :rating
      t.decimal :total_gross
      t.text :description
      t.date :released_on
      t.string :cast
      t.string :director
      t.string :duration
      t.string :image_file_name

      t.timestamps null: false
    end
  end
end
