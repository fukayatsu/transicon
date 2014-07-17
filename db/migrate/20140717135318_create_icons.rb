class CreateIcons < ActiveRecord::Migration
  def change
    create_table :icons do |t|
      t.integer :category_id
      t.string  :image

      t.timestamps
    end

    add_index :icons, :category_id
  end
end
