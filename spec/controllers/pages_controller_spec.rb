require 'spec_helper'

describe PagesController do
  render_views

  describe "GET 'home'" do

    before(:each) do
      get 'home'
    end

    subject { response }

    it { should be_success }
    it { should have_selector('title', :content => "Rhaiku | Home") }
    it { should have_selector('a', :content => 'Find your Zen') }

  end

  describe "GET 'contact'" do

    before(:each) do
      get 'contact'
    end

    subject { response }
    
    it { should be_success }
    it { should have_selector('title', :content => "Rhaiku | Contact") }

  end

  describe "GET 'about'" do

    before(:each) do
      get 'about'
    end

    subject { response }

    it { should be_success }
    it { should have_selector('title', :content => "Rhaiku | About") }

  end

end
