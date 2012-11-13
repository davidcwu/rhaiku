class WordsController < ApplicationController
  def index
    @words = Word.order('syllables')
  end

  def new
  end
end
