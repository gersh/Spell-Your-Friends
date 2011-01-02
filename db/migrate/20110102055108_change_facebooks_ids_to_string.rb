class ChangeFacebooksIdsToString < ActiveRecord::Migration
  def self.up
    change_column :facebook_friends, :friend_id, :string
    change_column :facebooks, :user_id, :string
  end

  def self.down
    change_column :facebooks, :user_id, :integer, :limit => 8
    change_column :facbeook_frineds, :friend_id, :integer, :limit => 8
  end
end
