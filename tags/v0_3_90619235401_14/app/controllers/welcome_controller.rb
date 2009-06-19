class WelcomeController < ApplicationController
  def index
      @albums = Album.newest
      @albumscomming = Album.last
      
      @albums_count = Album.count;
      @artists_count = Artist.count;
      @songs_count = Song.count;
      @labels_count = Label.count;
  end

end
