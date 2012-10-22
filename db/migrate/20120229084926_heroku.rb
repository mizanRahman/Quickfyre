class Heroku < ActiveRecord::Migration
  def up
    
  	drop_table :posts
    create_table :posts do |t|
      t.integer :subcatagory_id
      t.text :description

      t.timestamps
    end

  end

  def down
  end
end
