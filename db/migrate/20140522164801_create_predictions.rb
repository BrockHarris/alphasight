class CreatePredictions < ActiveRecord::Migration
  def change
    create_table :predictions do |t|
    	t.integer :advisor_id
    	t.string  :output 
      t.timestamps
    end
    add_index :predictions, :advisor_id
  end
end
