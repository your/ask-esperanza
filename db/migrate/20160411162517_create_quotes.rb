class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :value
      t.integer :vote_ups, default: 0
      t.integer :vote_downs, default: 0

      t.timestamps null: false
    end
  end
end
