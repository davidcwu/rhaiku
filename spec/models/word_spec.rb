require 'spec_helper'

describe Word do

  before(:each) do
    @attr = { :word => 'david', :syllables => '2' }
    @word = Word.new(@attr)
  end

  it "should respond to word" do
    @word.should respond_to(:word)
  end

  it "should respond to syllables" do 
    @word.should respond_to(:syllables)
  end
end
