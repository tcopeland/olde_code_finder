require 'date'

module OldeCodeFinder
  class Finder

    attr_accessor :file, :pctg

    def initialize(file, pctg)
      @file = file
      @pctg = pctg
    end

    def check_by_author(author)
      return if binary?
      total_lines = git_blame_output.size
      author_lines = git_blame_output.grep(/#{author}/).size
      actual_percent = calculate_percent(author_lines, total_lines)
      if actual_percent > pctg.to_f
        puts "More than #{pctg}% of #{file} was written by #{author} (#{actual_percent}%)"
      end
    end

    def check_by_date(date_string)
      return if binary?
      years_ago = date_string.match(/^(\d+)/)[1].to_i
      date_threshold = (Date.today - (years_ago*365))
      total_lines = git_blame_output.size
      older_lines = git_blame_output.select {|line| Date.strptime(line.match(/.*(\d{4}-\d{2}-\d{2})/)[1]) < date_threshold }.size
      actual_percent = calculate_percent(older_lines, total_lines)
      if actual_percent > pctg.to_f
        puts "More than #{pctg}% of #{file} was written more than #{years_ago} years ago (#{actual_percent}%)"
      end
    end

    private

    def calculate_percent(matched_lines, total_lines)
      ((matched_lines / total_lines.to_f) * 100).round
    end

    def binary?
      `git diff --numstat 4b825dc642cb6eb9a060e54bf8d69288fbee4904 HEAD -- #{file}`.match(/^-\t-\t/)
    end

    def git_blame_output
      @git_blame_output ||= `git blame --date=short #{file}`.split("\n").select {|x| x !~ /\s+\d+\)\s#/ }
    end
  end
end
