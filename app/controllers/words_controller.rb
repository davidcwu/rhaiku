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

  def edit
    @word = Word.find_by_id(params[:id])
    @title = 'Edit Word'
  end

  def update
    @word = Word.find_by_id(params[:id])
    if @word.update_attributes(params[:word])
      flash[:success] = "Successfully updated #{@word}"
      redirect_to @word
    else
      render :edit
    end
  end

  def show
    @word = Word.find_by_id(params[:id])
  end

end
