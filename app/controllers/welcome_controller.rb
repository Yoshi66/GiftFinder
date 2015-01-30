class WelcomeController < ApplicationController
  def home
    if signed_in?
      redirect_to demands_path
    else

    end
  end



  def about
  end

  def help
  end
end
