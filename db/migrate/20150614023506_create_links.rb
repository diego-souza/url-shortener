class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :long_url
      t.string :code

      t.timestamps null: false
    end

    add_index :links, :code, :unique => true
  end
end
