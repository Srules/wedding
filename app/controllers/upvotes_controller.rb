class UpvotesController < ApplicationController
  before_action :set_song, only: [:create, :destroy]

  # POST /songs
  # POST /songs.json
  def create
    @song.votes = @song.votes + 1

    respond_to do |format|
      if @song.save
        format.html { redirect_to songs_path, notice: "You just upvoted #{@song.title}!" }
      else
        format.html { render songs_path }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.votes = @song.votes - 1
    respond_to do |format|
      if @song.save
        format.html { redirect_to songs_path, notice: "You just downvoted #{@song.title}!" }
      else
        format.html { redirect_to songs_path }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:title, :artist, :url, :suggested_by, :votes)
    end
end
