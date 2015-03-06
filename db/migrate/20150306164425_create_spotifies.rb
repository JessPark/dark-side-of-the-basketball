class CreateSpotifies < ActiveRecord::Migration
  def change
    create_table :spotifies do |t|

      t.timestamps null: false
    end
  end
end
