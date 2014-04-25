class CreateJokes < ActiveRecord::Migration
  def change
    create_table :jokes do |t|
      t.string :title

      t.timestamps
    end
  end
end
