require 'spec_helper'

describe WordsController do
  render_views

  describe "GET 'index'" do
    it 'should succeed' do
      get 'index'
      response.should be_success
    end

    describe 'with existing words' do 
      before(:each) do 
        @word = FactoryGirl.create(:word)
      end

      it 'should list the words' do
        get 'index'
        response.should have_selector('li', :content => "#{@word.word} #{@word.syllables}")
      end
    end
  end
end
