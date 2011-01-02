class ChangeFriendIdLength < ActiveRecord::Migration
  def self.up
    change_column :facebook_friends, :friend_id,:integer, :limit => 8
    change_column :facebooks, :user_id, :integer, :limit => 8
  end

  def self.down
    change_column :facebook_friends, :friend_id,:integer, :limit => 4
    change_column :facebook_friends, :friend_id,:integer, :limit=>4
  end
end
