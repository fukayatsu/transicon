class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string  :name
      t.integer :position, null: false, default: 0

      t.timestamps
    end
    add_index :categories, :position
  end
end
