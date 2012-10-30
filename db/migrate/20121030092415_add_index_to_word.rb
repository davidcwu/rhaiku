class AddIndexToWord < ActiveRecord::Migration
  def change
    add_index :words, :syllables, :unique => true
  end
end
