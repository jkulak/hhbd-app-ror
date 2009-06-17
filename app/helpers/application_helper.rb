# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def song_linking_name(song)
    "<a href=\"" + song_path(song, :html) + "\">" + song.name + "</a>"
  end
  
  def album_linking_name(album)
    "<a href=\"" + album_path(album, :html) + "\">" + album.name + "</a>"
  end
  
  def label_linking_name(label)
    "<a href=\"" + label_path(label, :html) + "\">" + label.name + "</a>"
  end
  
  def artist_linking_name(artist)
    "<a href=\"" + artist_path(artist, :html) + "\">" + artist.name + "</a>"
  end
  
  def convert_seconds_to_time(seconds)
     total_minutes = seconds / 1.minutes
     seconds_in_last_minute = seconds - total_minutes.minutes.seconds
     "#{total_minutes}:#{seconds_in_last_minute}"
  end
  
end
