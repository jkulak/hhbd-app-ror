class Article < ActiveRecord::Base
  def awesome_truncate(length = 30, truncate_string = "...")
    return if self.news.nil?
    l = length - truncate_string.chars.length
    self.news.chars.length > length ? self.news[/\A.{#{l}}\w*\;?/m][/.*[\w\;]/m] + truncate_string : self.news
  end
end
