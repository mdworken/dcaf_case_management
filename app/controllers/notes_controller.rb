class NotesController < ApplicationController
  before_action :find_pregnancy, only: [:create]

  def create
    @note = @pregnancy.notes.new(note_params)
    @note.created_by = current_user
    @note.save
    if @note.save
      # redirect_to edit_pregnancy_path(@pregnancy)
      respond_to { |format| format.js }
    else
      flash[:alert] = 'Note failed to save! Please submit the note again.'
      redirect_to root_path
    end
  end

  def update
    # @note = Note.find params[:id]
    # @note.update_attributes note_params
    # respond_to { |format| format.js }
  end

  private

  def note_params
    params.require(:note).permit(:full_text)
  end

  def find_pregnancy
    @pregnancy = Pregnancy.find params[:id]
  end
end
