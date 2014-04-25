class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.belongs_to :jokes
      t.string :content

      t.timestamps
    end
  end
end
