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

  describe "POST 'create'" do
    describe "failure" do
      before(:each) do
        @attr = { :word => '', :syllables => 0 }
      end

      it 'should not create a word' do
        expect {
          post :create, :word => @attr
        }.to_not change(Word, :count)
      end
      
      it "should render the 'new' template" do
        post :create, :word => @attr
        response.should render_template('new')
      end
    end

    describe 'success' do
      before(:each) do
        @attr = { :word => 'david', :syllables => 2 }
      end
      
      it 'should create a word' do
        expect {
          post :create, :word => @attr
        }.to change(Word, :count).by(1)
      end

      it 'should redirect to the index' do
        post :create, :word => @attr
        response.should redirect_to(words_path)
      end
    end
    
  end

  describe "GET 'edit'" do
    before(:each) do
      @word = FactoryGirl.create(:word)
      get :edit, :id => @word.id
    end

    it 'should have the right title' do 
      response.should have_selector('title', :content => 'Edit Word')
    end

    it 'should have the right word displayed' do
      assigns[:word].should == @word
    end
  end
end
