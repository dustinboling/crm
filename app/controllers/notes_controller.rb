class NotesController < ApplicationController

  def index
    @notes = Note.all
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(params[:note])
    @note.user_id = current_user.id

    if @note.save
      redirect_to profile_activity_path(1)
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])

    if @note.update_attributes(params[:note])
      redirect_to :back, notice: "Note updated!"
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
  end

end
