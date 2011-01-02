class CreateFacebooks < ActiveRecord::Migration
  def self.up
    create_table :facebooks do |t|
      t.string :uid
      t.integer :user_id
      t.string :token

      t.timestamps
    end
  end

  def self.down
    drop_table :facebooks
  end
end
