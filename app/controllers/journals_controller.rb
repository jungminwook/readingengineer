class JournalsController < ApplicationController
  before_action :set_journal, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @journals = Journal.all
  end

  def show
  end

  def new
    @journal = current_user.journals.build
  end

  def edit
  end

  def create
    @journal = current_user.journals.build(journal_params)
    if @journal.save
      redirect_to @journal, notice: 'Journal was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @journal.update(journal_params)
      redirect_to @journal, notice: 'Journal was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @journal.destroy
    redirect_to journals_url
  end

  def correct_user
    @journal = current_user.journals.find_by(id: params[:id])
    redirect_to journals_path, notice: "Not authorized to edit this" if @journal.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_journal
      @journal = Journal.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def journal_params
      params.require(:journal).permit(:title, :body)
    end
end
