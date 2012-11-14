require 'spec_helper'

describe WordsController do
  render_views

  describe "GET 'index'" do

    describe 'sanity check' do

      before(:each) do
        get 'index'
      end

      subject { response }

      it { should be_success }
      it { should have_selector('h1', :content => "Words") }
      it { should have_selector('a', :href => new_word_path) }

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

  describe "GET 'new'" do
    describe 'sanity check' do

      before(:each) do
        get 'new'
      end

      subject { response }

      it { should be_success }
    end
  end
end
