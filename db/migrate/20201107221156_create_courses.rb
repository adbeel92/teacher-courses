class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :title, null: false
      t.text :description
      t.text :tags, null: false, array: true, default: []
      t.string :image_src
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
