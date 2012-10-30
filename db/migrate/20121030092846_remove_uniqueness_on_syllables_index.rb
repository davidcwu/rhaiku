class RemoveUniquenessOnSyllablesIndex < ActiveRecord::Migration
  def up
    remove_index :words, :column => :syllables 
    add_index :words, :syllables
  end

  def down
    remove_index :words, :column => :syllables
    add_index :words, :syllables, :unique => true
  end
end
