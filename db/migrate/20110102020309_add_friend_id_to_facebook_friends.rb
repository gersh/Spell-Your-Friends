class AddFriendIdToFacebookFriends < ActiveRecord::Migration
  def self.up
    add_column :facebook_friends, :friend_id, :integer
  end

  def self.down
    remove_column :facebook_friends, :friend_id
  end
end
