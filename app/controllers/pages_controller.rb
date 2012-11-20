class PagesController < ApplicationController

  def index
    if current_user
      redirect_to '/profile/1/activity'
    end
  end

end
