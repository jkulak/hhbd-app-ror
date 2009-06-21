REPO_PATH = "https://hhbd20.googlecode.com/svn/"

namespace :svn do
  
  # command line usage: rake svn:tag["your commit message", "rc3", 2, 0]
  # for svn copy foobar/trunk foobat/tags/v2_0_dategoeshere_buildnumbergoeshere_rc3 -m "your commit message"
  
  # dziala bez parametrow :/ jakos trzeba przeakzac parametry
  # no i pytanie, jak potem przekazac parametry do invoke???
  desc "Create new tag from trunk increasing build number"
  task :tag do |t, args|
    latest_tag = IO.popen("svn ls #{REPO_PATH}tags").readlines.last.chomp("/\n").split('_')
    
    major = args.major  
    if major.nil?
      major = latest_tag[0].delete 'v'
      printf "Assuming same major version: #{major}\n"
    end
    
    minor = args.minor  
    if minor.nil?
      minor = latest_tag[1]
      printf "Assuming same minor version: #{minor}\n"
    end

    date_part = "#{Time.now.strftime("%Y").last}#{Time.now.strftime("%m%d%H%M%S")}"    
    build = latest_tag.last.to_i + 1
    printf "Build number: #{build}\n"
    new_tag = "v#{major}_#{minor}_#{date_part}_#{build}"
    svn_cmd = "svn copy #{REPO_PATH}trunk #{REPO_PATH}tags/#{new_tag} -m \"Creating tag: #{new_tag} #{args.message}\""
    printf "Executing: #{svn_cmd}\n"
    system(svn_cmd)
  end
  
  desc "Commit changes and create new tag"
    task :tagit, :message, :description, :major, :minor do
    Rake::Task["svn:commit"].invoke
    Rake::Task["svn:tag"].invoke
  end
  
  #desc "Shortcut for commit_and_create_tag"
  #task :tagit => :commit_and_create_tag
  
  # command line usage: rake db:commit["your commit msg goes here"] - OK
  desc "Commit changes adding files before"
  task :commit, :message do |t, args|
    Rake::Task["svn:add"].invoke
    puts "Commiting changes..."
    svn_cmd = "svn ci -m \"#{args.message}\""
    system(svn_cmd)
  end
  
  # command line usage: rake db:add_new_files - OK
  desc "Add new files to subversion"
  task :add_new_files do
    puts "Adding files to repository..."
    system "svn status | grep '^\?' | sed -e 's/? *//' | sed -e 's/ /\ /g' | xargs svn add"
  end
  
  # command line usage: rake db:add - OK
  desc "shortcut for adding new files"
  task :add => [ :add_new_files ]
  
  namespace :deploy do
    desc "Deploy application from latest tag"
    task :deploy do
      list = IO.popen("svn ls #{REPO_PATH}tags")
      latest_tag = list.readlines.last.chomp
      printf "Exporting tag: #{latest_tag}\n"
      system("svn export #{REPO_PATH}tags/#{latest_tag}")    
    end
  end
  
  # dziala OK
  def get_tags_list(repo = REPO_PATH)
    IO.popen("svn ls #{repo}tags").readlines
  end
  
  # dziala OK
  def get_latest_build
    list = get_tags_list
    p list.last.chomp
  end
  
  # dziala OK
  task :test do
    get_latest_build
  end
 
  desc "Configure Subversion for Rails"
  task :configure_for_svn do
    system "svn remove log/*"
    system "svn commit -m 'removing all log files from subversion'"
    system 'svn propset svn:ignore "*.log" log/'
    system "svn update log/"
    system "svn commit -m 'Ignoring all files in /log/ ending in .log'"
    system 'svn propset svn:ignore "*.db" db/'
    system "svn update db/"
    system "svn commit -m 'Ignoring all files in /db/ ending in .db'"
    system "svn move config/database.yml config/database.yml.example"
    system "svn commit -m 'Moving database.yml to database.yml.example to provide a template for anyone who checks out the code'"
    system 'svn propset svn:ignore "database.yml" config/'
    system "svn update config/"
    system "svn commit -m 'Ignoring database.yml'"
    system "svn remove tmp/*"
    system "svn commit -m 'Removing /tmp/ folder'"
    system 'svn propset svn:ignore "*" tmp/'
  end  
end