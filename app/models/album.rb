class Album < ActiveRecord::Base
  belongs_to :artist
  belongs_to :label
  has_many :track_appearances
  has_many :songs, :through => :track_appearances
  has_attached_file :image, :styles => { :small => "100x100>", :medium => "300x300" },
                    :url  => "http://s.jkulak.megiteam.pl/albums/:id/:style/:basename.:extension",
                    :path => "/home/jkulak/www/imgs/albums/:id/:style/:basename.:extension"
    

  def url_name
  # callname = input.dup
  #  callname.downcase!
  #  callname.gsub!(/[Ąą]+/i,'a') # wielkie litery niepotrzebne, skoro mamy wyzej downcase
  #  callname.gsub!(/[Ęę]+/i,'e') 
  #  callname.gsub!(/[Óó]+/i,'o') 
  #  callname.gsub!(/[Łł]+/i,'l') 
  #  callname.gsub!(/[^a-z0-9]+/i, '-')
  #  callname.gsub!(/(^[-]+|[-]+$)/, '')
  #  return callname
     self.name.gsub(/[^[:alnum:]]/,'-') # zamien wszysktkie znaki z name ktore nie sa alfanumeryczna na -
  end

  def self.find_all_albums
    find(:all, :order => :release_date)
  end
  
  def self.newest
    find(:all, :order => :created_at, :limit => 2)
  end
  
  def self.last
    find(:all, :limit => 2, :order => :name)
  end
  
  def self.find_by_first_letter(letter)
    find(:all, :conditions => ['ucase(left(name, 1)) = ?', letter])
  end
  
  def self.group_albums(bands_ids)
    find(:all, :conditions => ['artist_id in(?)', bands_ids], :order => :release_date )
  end
  
  def to_param
    if self.artist.nil? 
      "#{id}-#{url_name}"
    else
      "#{id}-#{self.artist.url_name}-#{url_name}"
  end
    
  end
  
  
end
