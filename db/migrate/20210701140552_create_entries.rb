class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.text :title
      t.text :username
      t.text :password
      t.text :url
      t.text :note

      t.timestamps
    end
  end
end
