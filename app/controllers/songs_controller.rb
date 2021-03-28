class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    find_song
    @artist = Artist.find_by(id: @song.artist.id)
    @genre = Genre.find_by(id: @song.genre.id)
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(params.require(:song).permit(:name, :artist_id, :genre_id))
    @song.save
    redirect_to song_path(@song)
  end
  
  def edit
    find_song
  end
  
  def update
    find_song
    @song = Song.update(params.require(:song).permit(:name, :artist_id, :genre_id))
    redirect_to song_path(@song)
  end

  private 

  def find_song
    @song = Song.find_by(id: params[:id])
  end
end
