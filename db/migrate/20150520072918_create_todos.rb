class CreateTodos < ActiveRecord::Migration
  def change
  	create_table :todos do |t|
  		t.text :tache
  		t.integer :etat

  		t.timestamps
  	end
  end
end
