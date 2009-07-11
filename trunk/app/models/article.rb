class Article < ActiveRecord::Base
  def awesome_truncate(length = 30, truncate_string = "...")
    return if self.news.nil?
    l = length - truncate_string.chars.length
    self.news.chars.length > length ? self.news[/\A.{#{l}}\w*\;?/m][/.*[\w\;]/m] + truncate_string : self.news
  end
  
  # do wyszukiwarki
  # do wyswietlania po literkach?
  def self.search(param)
    find(:all, :order => "created_at desc", :conditions => ['title LIKE ?', "%#{param}%"])
  end
  
  def to_param
    "#{id}-#{url_name}"
  end
  
  def url_name
     self.title.gsub(/[^[:alnum:]]/,'-') # zamien wszysktkie znaki z name ktore nie sa alfanumeryczna na -
  end
end
