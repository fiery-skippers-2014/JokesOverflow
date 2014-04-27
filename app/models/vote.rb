class Vote < ActiveRecord::Base
  belongs_to :votable, :polymorphic => true

  def self.poo
    puts " $ # @" * 30
    puts "in a pooey mess"
  end
end