class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.date :date_hour
      t.string :subject
      t.string :description
      t.string :status

      t.timestamps
    end
  end
end
