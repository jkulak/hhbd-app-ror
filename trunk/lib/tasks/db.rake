# with thanks to sake
# http://errtheblog.com/posts/60-sake-bomb
namespace :db do

  # command line usage: rake db:version
  desc "Returns the current schema version"
  task :version => :environment do
    puts "Current version: " +
      ActiveRecord::Migrator.current_version.to_s
  end

  #rake db:dump
  desc "dumps the devel database to a sql file"
  task :dump => :environment do
    puts "Creating .sql dump file. Enter mysql root password. Just press Enter for none"
    #run a shell command mysqldump -u user -p database name to file name
    `mysqldump -uroot -p app_development > app_development_dump.sql`
  end

  #command line usage: rake db:dumpimport
  desc "imports the devel databse dump file to www2_sw"
  task :dumpimport => :environment do
    puts "Loading www2_sw_development_dump.sql. Enter mysql root password. Just press Enter for none"
    `mysql -uroot -p app_development < app_development_dump.sql`
  end
  
  # restor db - do napisania
  # mysql -h sql.jkulak.megiteam.pl -u my_1347a my_1347 -p < $1
  # powinien byc odczyt z konfiguracji aplikacji

end
