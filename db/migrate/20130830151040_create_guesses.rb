class CreateGuesses < ActiveRecord::Migration
  def change
    create_tables :guesses do |t|
      t.belongs_to :round
      t.belongs_to :card
      t.integer :correctness
      t.timestamps
    end
  end
end
