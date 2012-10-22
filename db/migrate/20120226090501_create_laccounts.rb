class CreateLaccounts < ActiveRecord::Migration
  def change
    create_table :laccounts do |t|
      t.string :code

      t.timestamps
    end
  end
end
