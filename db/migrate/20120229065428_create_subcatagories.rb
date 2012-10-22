class CreateSubcatagories < ActiveRecord::Migration
  def change
  	create_table :subcatagories do |t|
      t.integer :catagory_id
      t.string :name

      t.timestamps
    end
  end
end
