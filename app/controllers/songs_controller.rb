class SongsController < ApplicationController

  # GET /songs
  # GET /songs.json
  def index
    @songs = Song.all
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(song_params)
    @song.votes = 1

    if @song.url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      @song.url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end
    @song.url = "http://www.youtube.com/embed/#{ youtube_id }"

    respond_to do |format|
      if @song.save
        format.html { redirect_to root_path, notice: 'Song was successfully added. Thank you!' }
      else
        format.html { redirect_to root_path }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:title, :artist, :url, :suggested_by, :votes)
    end
end
