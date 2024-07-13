class CreateTimeBlock < ActiveRecord::Migration[6.1]
  def change
    create_table :time_blocks do |t|
      t.time :hour
      t.belongs_to :daily_contract, null: false, foreign_key: true

      t.timestamps
    end
  end
end
