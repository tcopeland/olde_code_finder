namespace :olde_code_finder do

  desc "Find code that's mostly by a particular person"
  task :find_by_author, [:glob, :author, :pctg] => :environment do |task, args|
    Dir[args[:glob]].each do |file|
      OldeCodeFinder::Finder.new(file, args[:pctg]).check_by_author(args[:author])
    end
  end

  desc "Find code older than a particular date"
  task :find_by_date, [:glob, :date_string, :pctg] => :environment do |task, args|
    Dir[args[:glob]].each do |file|
      OldeCodeFinder::Finder.new(file, args[:pctg]).check_by_date(args[:date_string])
    end
  end

end
