class CreateInspirationalQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :inspirational_quotes do |t|
      t.string :content
      t.integer :user_id
      
      t.timestamps null: false
    end
  end
end
