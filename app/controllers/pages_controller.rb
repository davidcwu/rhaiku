class PagesController < ApplicationController
  def home
    @title = 'Rhaiku | Home'
  end

  def contact
    @title = 'Rhaiku | Contact'
  end

  def about
    @title = 'Rhaiku | About'
  end
end
