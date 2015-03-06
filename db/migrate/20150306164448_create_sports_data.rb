class CreateSportsData < ActiveRecord::Migration
  def change
    create_table :sports_data do |t|

      t.timestamps null: false
    end
  end
end
