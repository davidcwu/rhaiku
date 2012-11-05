class WordsController < ApplicationController
  def index
    @words = Word.order('syllables')
  end
end
