class AddSlugToChapters < ActiveRecord::Migration[5.0]
  def change
    add_column :chapters, :slug, :string
    add_index :chapters, :slug, unique: true
  end
end
