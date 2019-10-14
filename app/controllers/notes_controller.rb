class NotesController < ApplicationController
  before_action :get_game

  def index
    @notes = @game.notes.sort_by_type
  end

  def new
    @note = @game.notes.new
  end

  def create
    @note = @game.notes.new(note_params)

    if @note.save
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def edit
    @note = @game.notes.find(params[:id])
  end

  def update
    @note = @game.notes.find(params[:id])

    @note.update_attributes(note_params)

    if @note.save
      redirect_to game_path(@game)
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @note = @game.notes.find(params[:id])
    @note.destroy
    redirect_to game_path(@game)
  end

  private
    def note_params
      params.require(:note).permit(:additional_info, :info_type)
    end

    def get_game
      @game = Game.find(params[:game_id])
    end
end
