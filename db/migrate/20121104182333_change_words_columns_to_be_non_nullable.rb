class ChangeWordsColumnsToBeNonNullable < ActiveRecord::Migration
  def up
    change_column :words, :word, :string, :null => false
    change_column :words, :syllables, :integer, :null => false
  end

  def down
    change_column :words, :word, :string, :null => true
    change_column :words, :syllables, :integer, :null => true
  end
end
