class CreateTableNoteCategoryRelationship < ActiveRecord::Migration
  def change
    create_table :note_category_relationships do |t|
      t.integer :note_id
      t.integer :category_id
    end
  end
end
