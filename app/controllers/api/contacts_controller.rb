class Api::ContactsController < ApplicationController

  # the index action will combine people/organizations
  # http://stackoverflow.com/questions/4318962/ruby-on-rails-render-json-for-multiple-models
  def index
    @people = Contact.all.order(:last_name).where("full_name like ?", "%#{params[:term]}%")
    @organizations = Contact.all.order(:company).where("company like ?", "%#{params[:term]}%")
  end

  def people
    @people = Contact.all.order(:last_name).where("full_name like ?", "%#{params[:term]}%")
    render json: @people.map(&:full_name)
  end

  def organizations
  end

end
