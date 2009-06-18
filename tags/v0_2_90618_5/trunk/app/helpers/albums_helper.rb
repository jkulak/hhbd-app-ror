module AlbumsHelper
  def album_menu_letters(selected)
    alfabet=['a','ą','b','c','ć','d','e','ę','f','g','h','i','j','k','l','ł','m','n','ń','o','ó','q','p','r','s','ś','t','u','w','y','z','ź','ż']
    menu = "<ul class=\"letternav\"><li><a href=\"" + albums_path + "\">Wszystkie</a></li><li><a>0..9</a></li>"
    
    alfabet.each { |i|  
       if (i==selected)
        menu += ("<li class=\"selected\">#{i}</li>")
      else
        menu += ("<li><a href=\"/albumy?l=#{i}\">#{i}</a></li>")
      end
      }
    menu += "</ul>"
    return menu  
  end 
  
end
