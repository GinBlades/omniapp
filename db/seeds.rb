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
