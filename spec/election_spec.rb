require './lib/candidate'
require './lib/race'
require './lib/election'

RSpec.describe Election do
  it 'exists' do
    election1 = Election.new("2024")
    expect(election1).to be_a(Election)
  end

  it 'has attributes' do
    election1 = Election.new("2024")
    expect(election1.year).to eq("2024")
    expect(election1.races).to eq([])
  end

  it 'add races in election' do
    election1 = Election.new("2024")
    race = Race.new("Texas Governor")
    candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
    candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
    expect(election1.races).to eq([])
    election1.add_race(race)
    expect(election1.races).to eq([race])
  end

  it 'candidates method' do
    election1 = Election.new("2024")
    race = Race.new("Texas Governor")
    candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
    candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
    election1.add_race(race)
    expect(election1.candidates).to eq([candidate1, candidate2])
  end

  it 'vote counts method' do
    election1 = Election.new("2024")
    race = Race.new("Texas Governor")
    candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
    candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
    election1.add_race(race)
    expect(election1.vote_counts).to eq({"Diana D" => 0, "Roberto R" => 0})
  end
end
