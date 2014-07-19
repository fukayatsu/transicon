class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.string :body_ja
      t.string :body_en

      t.timestamps
    end
  end
end
