class Election
  attr_reader :year,
              :races

  def initialize(year)
    @year = year
    @races = []
  end
  
  def add_race(race)
    @races << race
  end

  def candidates
    @races.map do |race|
      race.candidates.map do |candidate|
        candidate
      end
    end.flatten
  end

  def vote_counts
    vote_count_hash = Hash.new(0)
    candidates.each do |candidate|
    vote_count_hash[candidate.name] += candidate.votes
    end
    vote_count_hash
  end
end