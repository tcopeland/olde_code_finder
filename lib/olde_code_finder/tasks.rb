namespace :olde_code_finder do

  def checkit(file, author, pctg)
    blame_output = `git blame #{file}`.split("\n")
    total_lines = blame_output.size
    author_lines = blame_output.grep(/#{author}/).size
    if (author_lines / total_lines.to_f) > (pctg.to_f / 100.0)
      puts "More than #{pctg}% of #{file} was written by #{author}"
    end
  end

  # e.g., bundle exec rake olde_code_finder:find['app/models/partner*','Ben Franklin','80']
  desc "Find old code by a particular person"
  task :find, [:glob, :author, :pctg] => :environment do |task, args|
    Dir[args[:glob]].each do |file|
      checkit(file, args[:author], args[:pctg])
    end
  end
end
