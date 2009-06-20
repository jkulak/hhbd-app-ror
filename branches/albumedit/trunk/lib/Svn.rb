class Svn
  def get_latest_tag_name(repo_path)
    list = IO.popen("svn ls #{repo_path}tags").readlines
    tags = Array.new
    list.each { |elem|
      elem.scan(/v(\d+)[_\.]?(\d+)[_\.]?(\d+)[_\.]?(\d+)[_\.]?(.*)/).each { |a, b, c, d, comment| 
        tags.push({"major" => a.to_i, "minor" => b.to_i, "date" => c.to_i, "build" => d.to_i, "comment" => comment})
        }
      }
    tags.sort! { |a, b| [a["major"], a["minor"], a["date"], a["build"]] <=> [b["major"], b["minor"], b["date"], b["build"]] }
    latest = "v" + tags.last["major"].to_s + VERSION_DELIMITER + tags.last["minor"].to_s +
      VERSION_DELIMITER + tags.last["date"].to_s + VERSION_DELIMITER + tags.last["build"].to_s  + VERSION_DELIMITER + tags.last["comment"]
  end
  
end