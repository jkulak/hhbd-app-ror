class Artist < ActiveRecord::Base
  has_many :albums
  
  has_many :in_bands, :foreign_key => 'member_id', :class_name => 'BandMembership', :dependent => :destroy
  has_many :bands, :through => :in_bands
  has_many :has_members, :foreign_key => 'band_id', :class_name => 'BandMembership', :dependent => :destroy
  has_many :members, :through => :has_members
  
  has_attached_file :image, :styles => { :small => "100x", :medium => "300x" },
                    :url  => "/imgs/artists/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/imgs/artists/:id/:style/:basename.:extension"
  
  def url_name
     self.name.gsub(/[^[:alnum:]]/,'-') # zamien wszysktkie znaki z name ktore nie sa alfanumeryczna na -
  end
  
  def self.newest
    find(:all, :order => "added", :limit => 2)
  end
  
  def self.find_by_first_letter(letter)
         @artists = find(:all, :conditions => ['ucase(left(name, 1)) = ?', letter], :order => :name)
  end
   
  def to_param
    "#{id}-#{url_name}"
  end
   
  def self.all_for_select
    self.all.map {|x| [x.name, x.id]}
  end
end
