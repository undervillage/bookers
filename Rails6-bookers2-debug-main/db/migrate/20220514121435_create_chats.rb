class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.references :speaker, foreign_key: { to_table: :users }
      t.references :replyer, foreign_key: { to_table: :users }
      t.text :message

      t.timestamps
    end
  end
end
