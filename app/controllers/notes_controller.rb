class NotesController < ApplicationController
  def index
    #@notes = Note.all
    @notes = Note.sort_by_type
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)

    if @note.save
      redirect_to notes_path
    else
      render :new
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])

    @note.update_attributes(note_params)

    if @note.save
      redirect_to notes_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to notes_path
  end

  private
    def note_params
      params.require(:note).permit(:additional_info, :info_type)
    end
end
