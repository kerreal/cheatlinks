class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.text :title
      t.text :link
      t.text :discription
      t.timestamps
    end
  end
end
