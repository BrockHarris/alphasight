class CreateAdvisors < ActiveRecord::Migration
  def change
    create_table :advisors do |t|
    	t.integer  :pattern
    	t.string   :domain
    	t.string   :email
    	t.string   :full_name
    	t.string   :first_name
    	t.string   :last_name
    	t.boolean  :is_prediction, :default => false

      t.timestamps
    end
  end
end
