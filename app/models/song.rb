class Song < ActiveRecord::Base
  has_many :track_appearances
  has_many :albums, :through => :track_appearances
  belongs_to :creator, :class_name => "User", :foreign_key => "created_by"
  belongs_to :editor, :class_name => "User", :foreign_key => "updated_by"
  
  def url_name
     self.name.gsub(/[^[:alnum:]]/,'-') # zamien wszysktkie znaki z name ktore nie sa alfanumeryczna na -
  end
  
  def self.find_by_first_letter(letter)
    find(:all, :conditions => ['ucase(left(name, 1)) = ?', letter])
  end
  
  def self.all_for_select
    self.all.map {|x| [x.name, x.id]}
  end
  
  def to_param
    "#{id}-#{url_name}"
  end
end
