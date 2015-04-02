require "#{Rails.root}/db/seeds/budget_categories.rb"

if Health::Category.count < 1
  ['Anxiety', 'BM', 'Diet', 'Exercise', 'Energy Level', 'Stress', 'Stomach Discomfort'].each do |cat|
    Health::Category.create name: cat, slug: cat.parameterize
  end
end

if Health::WorkoutCategory.count < 1
  ['Running/Jogging', 'Weight Lifting', 'Boxing', '7-Minute Workout', 'Yoga'].each do |cat|
    Health::WorkoutCategory.create name: cat, slug: cat.parameterize
  end
end

if Notes::Entry.count < 1
  config           = Rails.configuration.database_configuration
  host             = config[Rails.env]["host"]
  database         = config[Rails.env]["database"]
  username         = config[Rails.env]["username"]
  password         = config[Rails.env]["password"]
  if username.present?
    system %[PGPASSWORD=#{password} psql -h #{host} -U #{username} #{database} < #{Rails.root}/lib/assets/notes.sql]
  else
    system %[psql #{database} < #{Rails.root}/lib/assets/notes.sql]
  end
end

if Budget::Category.count < 1
  budget_categories
end
