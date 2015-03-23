if Health::Category.count < 1
  ['Anxiety', 'BM', 'Diet', 'Exercise', 'Energy Level', 'Stress', 'Stomach Discomfort'].each do |cat|
    Health::Category.create name: cat, slug: cat.parameterize
  end
end
