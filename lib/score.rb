class Score < ActiveRecord::Base

    def self.highscores
        high = Score.order(score: :desc)
        high.each {|s| puts "#{s.name} escaped quarantine in #{s.score} turns."}
    end
end