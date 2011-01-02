class CreateFacebookFriends < ActiveRecord::Migration
  def self.up
    create_table :facebook_friends do |t|
      t.references :facebook
      t.string :friend

      t.timestamps
    end
  end

  def self.down
    drop_table :facebook_friends
  end
end
