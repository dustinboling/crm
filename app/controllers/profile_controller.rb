class ProfileController < ApplicationController

  layout 'profile'

  def show
    @user = User.find(params[:id])
  end

  def activity
    if current_user
      @user = User.find(current_user.id)
      @notes = @user.notes.order('id DESC')
    else
      redirect_to :login, notice: "Must be logged in!"
    end
  end

end
