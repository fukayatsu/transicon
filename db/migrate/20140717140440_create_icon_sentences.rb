class CreateIconSentences < ActiveRecord::Migration
  def change
    create_table :icon_sentences do |t|
      t.integer :icon_id
      t.integer :sentence_id

      t.timestamps
    end
  end
end
