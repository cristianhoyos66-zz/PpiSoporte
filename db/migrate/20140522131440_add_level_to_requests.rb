class AddLevelToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :level, :integer
  end
end
