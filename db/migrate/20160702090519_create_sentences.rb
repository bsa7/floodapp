class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.string :text

      t.timestamps null: false
    end
    add_index :sentences, :text
  end
end
