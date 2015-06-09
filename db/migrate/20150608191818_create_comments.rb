class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.string :author_name
      t.text :body
      t.datetime :date
       
      t.timestamps null: false
    end
  end
end
