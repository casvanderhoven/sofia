class CreateChapters < ActiveRecord::Migration[5.0]
  def change
    create_table :chapters do |t|
      t.string :name
      t.integer :start_line
      t.integer :end_line
      t.references :work, foreign_key: true

      t.timestamps
    end
  end
end
