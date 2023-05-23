class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :poster_url
      t.string :year
      t.string :director
      t.string :writer
      t.text   :plot
      t.string :genre

      t.timestamps
    end
  end
end
