class CreateContract < ActiveRecord::Migration[6.1]
  def change
    create_table :contracts do |t|
      t.string :service_name

      t.timestamps
    end
  end
end
