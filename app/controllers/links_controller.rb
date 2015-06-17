class LinksController < ApplicationController
  before_action :set_link, only: [:destroy]

  # GET /links
  # GET /links.json
  def index
    @links = Link.all
    @link = Link.new
  end

  # POST /links
  # POST /links.json
  def create
    @link = Link.new(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to links_url, notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @link }
      else
        @links = Link.all
        format.html { render :index }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def redirect
    @link = Link.where(code: params[:code]).first
    if @link
      redirect_to @link.long_url
    else
      flash[:alert] = "Erro: Link não existe!"
      redirect_to links_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:long_url, :short_url)
    end
end
