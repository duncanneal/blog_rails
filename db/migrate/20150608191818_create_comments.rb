class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.string :author_name
      t.string :author_email
      t.date :date
      t.text :body
      t.references :post_id
       
      t.timestamps null: false
    end
  end
end
