class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.references :votable, polymorphic: true
      t.integer :voted_by_id, foreign_key: { references: %i[teachers id] }, null: false

      t.timestamps
    end
  end
end
