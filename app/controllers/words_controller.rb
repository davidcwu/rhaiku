class WordsController < ApplicationController
  def index
    @words = Word.order('syllables')
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(params[:word])
    if @word.save
      flash[:success] = "Success!"
      redirect_to(words_path)
    else
      @title = 'Create Word'
      render :new
    end
  end
end
