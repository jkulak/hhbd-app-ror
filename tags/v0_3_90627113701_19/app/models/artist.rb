class Artist < ActiveRecord::Base
  has_many :albums
  
  has_many :in_bands, :foreign_key => 'member_id', :class_name => 'BandMembership', :dependent => :destroy
  has_many :bands, :through => :in_bands
  has_many :has_members, :foreign_key => 'band_id', :class_name => 'BandMembership', :dependent => :destroy
  has_many :members, :through => :has_members
  
  has_many :nicknames
  after_update :save_nicknames
  
  has_attached_file :image, :styles => { :small => "100x", :medium => "300x" },
                    :url  => App::Paperclip.paperclip_base_url + "artists/:id/:style/:basename.:extension",
                    :path => App::Paperclip.paperclip_base_path + "artists/:id/:style/:basename.:extension"
                    
  belongs_to :creator, :class_name => "User", :foreign_key => "created_by"
  belongs_to :editor, :class_name => "User", :foreign_key => "updated_by"
  
  def nickname_attributes=(nickname_attributes)
    nickname_attributes.each do |attributes|
      if attributes[:id].blank?
        nicknames.build(attributes)
      else
        nickname = nicknames.detect { |n| n.id == attributes[:id].to_i }
        nickname.attributes = attributes
      end
    end
  end
  
  def save_nicknames
    nicknames.each { |n| 
      if n.should_destroy? or n.name.blank?
        n.destroy
      else
        n.save(false)
      end
    }
  end
  
  def url_name
     self.name.gsub(/[^[:alnum:]]/,'-') # zamien wszysktkie znaki z name ktore nie sa alfanumeryczna na -
  end
  
  def self.newest
    find(:all, :order => "added", :limit => 2)
  end
  
  def self.find_by_first_letter(letter)
         @artists = find(:all, :conditions => ['ucase(left(name, 1)) = ?', letter])
  end
   
  def to_param
    "#{id}-#{url_name}"
  end
   
  def self.all_for_select
    self.find(:all, :order => "name").map { |x| [x.name, x.id] }
  end
end
