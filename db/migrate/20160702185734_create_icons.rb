class CreateIcons < ActiveRecord::Migration
  def change
    create_table :icons do |t|
      t.string :name

      t.timestamps null: false
    end
    add_index :icons, :name
  end
end
