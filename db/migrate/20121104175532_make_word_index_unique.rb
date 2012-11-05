class MakeWordIndexUnique < ActiveRecord::Migration
  def up
    remove_index :words, :column => :word
    add_index :words, :word, :unique => true
  end

  def down
    remove_index :words, :column => :word
    add_index :words, :word
  end
end
