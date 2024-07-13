class CreateAssignment < ActiveRecord::Migration[6.1]
  def change
    create_table :assignments do |t|
      t.references :user, null: false, foreign_key: true
      t.belongs_to :time_block, null: false, foreign_key: true
      t.date :date
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
