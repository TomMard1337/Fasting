class HomeController < ApplicationController
  def index
    @addfasts = Addfast.all
  end

  def about
  end

  def contact
  end
  def bmr
    @addfasts = Addfast.all
  end
end
