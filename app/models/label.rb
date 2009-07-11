class Label < ActiveRecord::Base
  has_many :albums
  
  has_attached_file :image, :styles => { :small => "100x", :medium => "300x" },
                    :url  => App::Paperclip.paperclip_base_url + "labels/:id/:style/:basename.:extension",
                    :path => App::Paperclip.paperclip_base_path + "labels/:id/:style/:basename.:extension"
  belongs_to :creator, :class_name => "User", :foreign_key => "created_by"
  belongs_to :editor, :class_name => "User", :foreign_key => "updated_by"
  
  def url_name
     self.name.gsub(/[^[:alnum:]]/,'-') # zamien wszysktkie znaki z name ktore nie sa alfanumeryczna na -
  end
  
  def self.find_by_first_letter(letter)
    find(:all, :conditions => ['ucase(left(name, 1)) = ?', letter])
  end
  
  # do wyszukiwarki
  # do wyswietlania po literkach?
  def self.search(param)
    find(:all, :order => "name asc", :conditions => ['name LIKE ?', "%#{param}%"])
  end
  
  def self.all_for_select
    self.find(:all, :order => "name").map { |x| [x.name, x.id] }
  end
  
  def to_param
    "#{id}-#{url_name}"
  end
  
  
end
