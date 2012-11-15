class ProfileController < ApplicationController

  def show
    @user = User.find(params[:id])
    @tag_list = Profile.generate_tag_list(@user.id)

    if params[:tag]
      @contacts = @user.contacts.tagged_with(params[:tag])
        .page(params[:page]).per(6)
    else
      @contacts = @user.contacts.order('last_name ASC')
        .page(params[:page]).per(6)
    end
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

