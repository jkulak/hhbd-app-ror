class Album < ActiveRecord::Base
  belongs_to :artist
  belongs_to :label
  has_many :track_appearances
  has_many :songs, :through => :track_appearances
  has_attached_file :image, :styles => { :small => "100x100>", :medium => "300x300" },
                    :url  => App::Paperclip.paperclip_base_url + "albums/:id/:style/:basename.:extension",
                    :path => App::Paperclip.paperclip_base_path + "albums/:id/:style/:basename.:extension"
  belongs_to :creator, :class_name => "User", :foreign_key => "created_by"
  belongs_to :editor, :class_name => "User", :foreign_key => "updated_by"
                    
  def media_types
    {1 => "CD", 2 => "LP", 3 => "EP", 4 => "MP3", 5 => "MC", 6 => "Inne? Ale jakie???"}
  end
  
  def artist_name
    artist.name if artist
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name) unless name.blank?
  end
  
=begin
  TODO zrobić z tego partiala
=end
  def url_name
     self.name.gsub(/[^[:alnum:]]/,'-')
  end

  def self.find_all_albums
    find(:all, :order => :release_date)
  end
  
  def released?
     release_date.to_time < Time.now
  end
  
  def premiere
     self.released? ? release_date.strftime('%d %B %Y') : (to_be_released?) ? to_be_released : release_date.strftime('%d %B %Y')
   end

  def self.newest
    find(:all, :order => :created_at, :limit => 2)
  end
  
  def self.last
    find(:all, :limit => 2, :order => :name)
  end
  
  def self.incoming(count)
    find(:all, :limit => count, :order => :release_date, :conditions => ['release_date > ?', Time.now] )
  end
  
  def self.recent(count)
    find(:all, :limit => count, :order => "release_date desc", :conditions => ['release_date <= ?', Time.now])
  end
  
  def self.find_by_first_letter(letter)
    find(:all, :conditions => ['ucase(left(name, 1)) = ?', letter])
  end
  
  def self.group_albums(bands_ids)
    find(:all, :conditions => ['artist_id in(?)', bands_ids], :order => "release_date desc" )
  end

  def to_param
    if self.artist.nil? 
      "#{id}-#{url_name}"
    else
      "#{id}-#{self.artist.url_name}-#{url_name}"
    end
  end
end