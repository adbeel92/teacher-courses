class CreateTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers do |t|
      t.string :email, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :specialism, null: false
      t.string :avatar

      t.timestamps
    end
    add_index :teachers, :email, unique: true
  end
end
