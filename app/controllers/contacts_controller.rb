class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
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
      redirect_to profile_path, notice: "Contact created!"
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
    @contact.destroy
  end

end
