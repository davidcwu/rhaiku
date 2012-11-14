class WordsController < ApplicationController
  def index
    @words = Word.order('syllables')
  end

  def new
    @word = Word.new
  end
end
