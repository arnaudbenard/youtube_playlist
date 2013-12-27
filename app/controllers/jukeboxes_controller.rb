class JukeboxesController < ApplicationController
  before_action :set_jukebox, only: [:show, :edit, :update, :destroy]

  # GET /jukeboxes
  # GET /jukeboxes.json
  def index
    @jukeboxes = Jukebox.all
  end

  # GET /jukeboxes/1
  # GET /jukeboxes/1.json
  def show
  end

  def search_video
    @result = Jukebox.search_on_youtube(params['term'])

    @result_json = []

    @result.videos.each do |video|
      @result_json << { "title"=> video.title, "url" => video.media_content.first.url }
    end
    render :json => @result_json
  end

  # GET /jukeboxes/new
  def new
    @jukebox = Jukebox.new
  end

  # GET /jukeboxes/1/edit
  def edit
  end

  # POST /jukeboxes
  # POST /jukeboxes.json
  def create
    @jukebox = Jukebox.new(jukebox_params)

    respond_to do |format|
      if @jukebox.save
        format.html { redirect_to @jukebox, notice: 'Jukebox was successfully created.' }
        format.json { render action: 'show', status: :created, location: @jukebox }
      else
        format.html { render action: 'new' }
        format.json { render json: @jukebox.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jukeboxes/1
  # PATCH/PUT /jukeboxes/1.json
  def update
    respond_to do |format|
      if @jukebox.update(jukebox_params)
        format.html { redirect_to @jukebox, notice: 'Jukebox was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @jukebox.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jukeboxes/1
  # DELETE /jukeboxes/1.json
  def destroy
    @jukebox.destroy
    respond_to do |format|
      format.html { redirect_to jukeboxes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jukebox
      @jukebox = Jukebox.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jukebox_params
      params.require(:jukebox).permit(:title, :list)
    end
end
