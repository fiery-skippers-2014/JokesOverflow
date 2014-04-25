class CreateJokes < ActiveRecord::Migration
  def change
    create_table :jokes do |t|
      t.text :title

      t.timestamps
    end
  end
end
