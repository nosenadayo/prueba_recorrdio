class CreateUser < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :color
      t.string :name
      t.timestamps
    end
  end
end
