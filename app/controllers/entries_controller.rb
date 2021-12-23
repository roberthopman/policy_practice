class EntriesController < ApplicationController
  before_action :find_entry, only: [:show, :edit, :update, :destroy]
  before_action :check_login

  def new    
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.user = current_user
    if @entry.save
      redirect_to entries_url, notice: 'Entry was successfully created.'
    else      
      respond_to do |format|
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace(@entry, partial: "form", locals: { entry: @entry })
        }
      end
    end
  end

  def show; end

  def index
    authorize!
    @entries = Entry.all
  end

  def edit
    authorize! @entry
  end

  def update
    @entry.title = entry_params[:title]
    if @entry.has_changes_to_save? && @entry.save
      redirect_to entries_url, notice: 'Entry was successfully updated.'
    else    
      flash.now[:alert] = "Entry update failed."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize!
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to entries_url, notice: "Entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def entry_params
      params.require(:entry).permit(:title, :username, :password, :url, :note)
    end

    def find_entry
      @entry = Entry.find(params[:id])      
    end

    def check_login
      flash[:alert] = "Login required" if require_login
    end
end
