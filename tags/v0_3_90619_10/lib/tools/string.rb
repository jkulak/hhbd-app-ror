class Tools_String
  def Tools_String.create_url(input)
    callname.downcase!
    callname = input.dup
    callname.gsub!(/[Ąą]+/i,'a') 
    callname.gsub!(/[Ęę]+/i,'e') 
    callname.gsub!(/[Óó]+/i,'o') 
    callname.gsub!(/[Łł]+/i,'l') 
    callname.gsub!(/[^a-z0-9]+/i, '-')
    callname.gsub!(/(^[-]+|[-]+$)/, '')
    return callname
  end

end