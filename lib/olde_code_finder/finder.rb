require 'date'

module OldeCodeFinder
  class Finder

    attr_accessor :file, :pctg

    def initialize(file, pctg)
      @file = file
      @pctg = pctg
    end

    def check_by_author(author)
      total_lines = git_blame_output.size
      author_lines = git_blame_output.grep(/#{author}/).size
      if (author_lines / total_lines.to_f) > (pctg.to_f / 100.0)
        puts "More than #{pctg}% of #{file} was written by #{author}"
      end
    end

    def check_by_date(date_string)
      years_ago = date_string.match(/^(\d+)/)[1].to_i
      date_threshold = (Date.today - (years_ago*365))
      total_lines = git_blame_output.size
      older_lines = git_blame_output.select {|line| Date.strptime(line.match(/.*(\d{4}-\d{2}-\d{2})/)[1]) < date_threshold }.size
      if (older_lines / total_lines.to_f) > (pctg.to_f / 100.0)
        puts "More than #{pctg}% of #{file} was written more than #{years_ago} years ago"
      end
    end

    private

    def git_blame_output
      @git_blame_output ||= `git blame --date=short #{file}`.split("\n").select {|x| x !~ /\s+\d+\)\s#/ }
    end
  end
end
