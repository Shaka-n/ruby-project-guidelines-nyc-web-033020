class CreateScore < ActiveRecord::Migration[5.0]
  def change
    def self.highscores
      high = Score.order(score: :desc)
      high.each {|s| puts "#{s.name} escaped quarantine in #{s.score} turns."}
  end
  end
end
