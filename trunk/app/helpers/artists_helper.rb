module ArtistsHelper
  def artist_menu_letters(css_class="", selected=nil)
    alfabet=['a','ą','b','c','ć','d','e','ę','f','g','h','i','j','k','l','ł','m','n','ń','o','ó','q','p','r','s','ś','t','u','w','y','z','ź','ż']
    menu = "<ul class=\"" + css_class + "\"><li><a href=\"" + artists_path + "\">Wszystkie</a></li><li><a>0..9</a></li>"
    
    alfabet.each { |i|  
       if (i==selected)
        menu += ("<li class=\"selected\">#{i}</li>")
      else
        menu += ("<li><a href=\"" + artists_path + "?l=#{i}\">#{i}</a></li>")
      end
      }
    menu += "</ul>"
    return menu  
  end
  
  def add_nickname_link(name)
    link_to_function (image_tag("ico-add.png") + name) do |page| 
  		page.insert_html :bottom, :nicknames, :partial => 'nickname', :object => Nickname.new
  	end
  end
end
