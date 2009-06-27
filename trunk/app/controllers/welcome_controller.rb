class WelcomeController < ApplicationController
  def index
      @recent_albums = Album.recent(3)
      @incoming_albums = Album.incoming(3)
      
      @albums_count = Album.count;
      @artists_count = Artist.count;
      @songs_count = Song.count;
      @labels_count = Label.count;
  end

end
