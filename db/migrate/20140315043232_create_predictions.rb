class CreatePredictions < ActiveRecord::Migration
  def change
    create_table :predictions do |t|
    	t.integer :bracket_id
    	t.integer :winner_id
    	t.integer :slot
    	t.integer :round
    	t.string :region

      t.timestamps
    end
  end
end
