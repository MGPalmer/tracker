class BasicDataModelWithBigJoinTable < ActiveRecord::Migration
  def up
    create_table "campaigns" do |t|
      t.string   "name"
      t.string   "ref"
      t.boolean :enabled, :default => true
      t.timestamps
    end

    create_table "goals" do |t|
      t.string   "name"
      t.string   "ref"
      t.timestamps
    end

    create_table "deals" do |t|
      t.string   "name"
      t.string   "ref"
      t.timestamps
    end

    create_table "pixels" do |t|
      t.string   "name"
      t.text     "content",    :limit => 2147483647
      t.boolean  :enabled, :default => true
      t.timestamps
    end

    create_table "rules" do |t|
      t.references :campaign
      t.references :goal
      t.references :deal
      t.references :pixel, :null => false
      t.timestamps
    end

    add_index :rules, [:campaign_id, :goal_id, :deal_id, :pixel_id], :name => "cgdp"
    add_index :rules, [:goal_id, :deal_id, :pixel_id], :name => "gdp"
    add_index :rules, [:deal_id, :pixel_id], :name => "gd"
    add_index :rules, [:pixel_id], :name => "p"

  end

  def down
    [:campaigns, :goals, :deals, :pixels, :rules].each do |table|
      drop_table table
    end
  end
end
