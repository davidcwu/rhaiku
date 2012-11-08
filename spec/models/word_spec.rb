require 'spec_helper'

describe Word do
  let(:attr) { { :word => 'david', :syllables => '2' } }
  let(:word) { Word.new(attr) }
  
  subject { word }

  it { should respond_to :word }
  it { should respond_to :syllables }

  describe "word field" do

    it "can never be nil" do
      bad_word_entry = Word.new(attr.merge( :word => nil ))
      bad_word_entry.should_not be_valid
    end

    it "must be unique" do
      first_word_entry = word.save
      duplicate_word_entry = Word.new(attr)
      duplicate_word_entry.should_not be_valid
    end

    it "cannot contain numbers" do
      bad_word_entry = Word.new(attr.merge( :word => 'na9' ))
      bad_word_entry.should_not be_valid
    end
    
    it "cannot contain special characters" do
      bad_word_entry = Word.new(attr.merge( :word => 'super8' ))
      bad_word_entry.should_not be_valid
    end

    it "cannot contain spaces" do
      bad_word_entry = Word.new(attr.merge( :word => 'super mang' ))
      bad_word_entry.should_not be_valid
    end
  end

  describe "syllables field" do
    it "can never be nil" do
      bad_word_entry = Word.new(attr.merge( :syllables => nil ))
      bad_word_entry.should_not be_valid
    end

    it "must be a positive number" do
      bad_word_entry = Word.new(attr.merge( :syllables => 0 ))
      bad_word_entry.should_not be_valid
    end

    it "must be less than 8" do
      bad_word_entry = Word.new(attr.merge( :syllables => 8 ))
      bad_word_entry.should_not be_valid
    end

  end

end
