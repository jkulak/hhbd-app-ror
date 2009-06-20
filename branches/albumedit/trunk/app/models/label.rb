class Label < ActiveRecord::Base
  has_many :albums
  
  has_attached_file :image, :styles => { :small => "100x", :medium => "300x" },
                    :url  => "#{PAPERCLIP_BASE_URL}labels/:id/:style/:basename.:extension",
                    :path => "#{PAPERCLIP_BASE_PATH}labels/:id/:style/:basename.:extension"
  
  def url_name
     self.name.gsub(/[^[:alnum:]]/,'-') # zamien wszysktkie znaki z name ktore nie sa alfanumeryczna na -
  end
  
  def self.find_by_first_letter(letter)
    find(:all, :conditions => ['ucase(left(name, 1)) = ?', letter])
  end
  
  def self.all_for_select
    self.find(:all, :order => "name").map { |x| [x.name, x.id] }
  end
  
  def to_param
    "#{id}-#{url_name}"
  end
  
  
end
