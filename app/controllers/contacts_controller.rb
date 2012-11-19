class ContactsController < ApplicationController

  layout 'profile'

  def index
    @user = User.find(params[:profile_id])
    @tag_list = Profile.generate_tag_list(@user.id)

    if params[:tag]
      @contacts = @user.contacts.tagged_with(params[:tag])
        .page(params[:page]).per(6)
    else
      @contacts = @user.contacts.order('last_name ASC')
        .page(params[:page]).per(6)
    end
  end

  def show
    @contact = Contact.find(params[:id])
    @notes = @contact.notes.order('id DESC')
  end

  def new
    @contact = Contact.new
    @phone = @contact.phones.build
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.user_id = current_user.id

    if @contact.save
      redirect_to profile_path(1), notice: "Contact created!"
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])

    if @contact.update_attributes(params[:contact])
      redirect_to profile_contact_path, notice: "Contact updated!"
    end
  end

  def destroy
    @contact = Contact.find(params[:id])

    if @contact.destroy
      redirect_to profile_path(1), notice: "Contact destroyed!"
    end
  end

end
