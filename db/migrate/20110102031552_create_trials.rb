class CreateTrials < ActiveRecord::Migration
  def self.up
    create_table :trials do |t|
      t.references :facebook
      t.integer :friend1_id
      t.integer :friend2_id

      t.timestamps
    end
  end

  def self.down
    drop_table :trials
  end
end
