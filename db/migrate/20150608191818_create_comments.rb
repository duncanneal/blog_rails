class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.text :body
      t.string :author
      t.datetime :date 
      t.timestamps null: false
      t.references :post
    end
  end
end
