class CreateInspirationalQuotes < ActiveRecord::Migration
  def change
    create_table :inspirational_quotes do |t|
      t.string :content
      t.integer :user_id
      
      t.timestamps null: false
    end
  end
end
