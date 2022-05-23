class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :title
      t.integer :article_id
      t.integer :event_id
      t.integer :news_id
      t.timestamps
    end
  end
end
