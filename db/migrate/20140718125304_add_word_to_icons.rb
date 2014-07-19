class AddWordToIcons < ActiveRecord::Migration
  def change
    add_column :icons, :word, :string
  end
end
