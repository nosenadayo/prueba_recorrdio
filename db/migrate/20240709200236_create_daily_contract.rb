class CreateDailyContract < ActiveRecord::Migration[6.1]
  def change
    create_table :daily_contracts do |t|
      t.integer :day
      t.time :start_time
      t.time :end_time
      t.belongs_to :contract

      t.timestamps
    end
  end
end
