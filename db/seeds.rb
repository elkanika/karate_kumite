# Clear existing data
Match.destroy_all
Enrollment.destroy_all
Category.destroy_all
Tournament.destroy_all
Competitor.destroy_all

puts "🧹 Old data cleared."

# 1. Create Competitors
daniel = Competitor.create!(
  first_name: "Daniel",
  last_name: "LaRusso",
  age: 17,
  belt: "Black",
  dojo: "Miyagi-Do"
)

johnny = Competitor.create!(
  first_name: "Johnny",
  last_name: "Lawrence",
  age: 17,
  belt: "Black",
  dojo: "Cobra Kai"
)

puts "✅ Competitors created: #{daniel.first_name} and #{johnny.first_name}"

# 2. Create Tournament
valley_tournament = Tournament.create!(
  name: "All Valley Karate Championship",
  date: Date.current,
  location: "Reseda, CA"
)

puts "✅ Tournament created: #{valley_tournament.name}"

# 3. Create Categories
kata_category = Category.create!(
  tournament: valley_tournament,
  name: "Under 18 Kata",
  modality: :kata
)

kumite_category = Category.create!(
  tournament: valley_tournament,
  name: "Under 18 Kumite",
  modality: :kumite
)

puts "✅ Categories created: Kata and Kumite"

# 4. Enroll Competitors
Enrollment.create!(competitor: daniel, category: kumite_category)
Enrollment.create!(competitor: johnny, category: kumite_category)

puts "✅ Enrollments created for Kumite"

# 5. Create a Match (Kumite Final)
match = Match.create!(
  category: kumite_category,
  competitor1: daniel,
  competitor2: johnny,
  winner: daniel,
  score_data: {
    competitor1_points: 3,
    competitor2_points: 2,
    notes: "Crane kick finish"
  }
)

puts "✅ Match created: #{match.competitor1.first_name} vs #{match.competitor2.first_name} (Winner: #{match.winner.first_name})"
puts "🎉 Verification Complete!"
