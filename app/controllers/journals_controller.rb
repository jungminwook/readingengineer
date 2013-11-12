class JournalsController < ApplicationController
  before_action :set_journal, only: [:show, :edit, :update, :destroy]

  def index
    @journals = Journal.all
  end

  def show
  end

  def new
    @journal = Journal.new
  end

  def edit
  end

  def create
    @journal = Journal.new(journal_params)
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_journal
      @journal = Journal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def journal_params
      params.require(:journal).permit(:body)
    end
end
