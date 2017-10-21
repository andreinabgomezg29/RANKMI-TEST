class CreateTrees < ActiveRecord::Migration[5.1]
  def change
    create_table :trees do |t|
      t.string :area
      t.float :score
      t.timestamps
    end
  end
end
