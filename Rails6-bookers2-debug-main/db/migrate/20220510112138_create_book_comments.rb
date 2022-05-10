class CreateBookComments < ActiveRecord::Migration[6.1]
  def change
    create_table :book_comments do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
