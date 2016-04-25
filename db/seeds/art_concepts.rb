def art_concepts
  %w(Sad Happy Dark Lively Calm).each do |mood|
    Art::Mood.create(name: mood)
  end

  %w(Sci-Fi Fantasy Historical Realistic Romance).each do |genre|
    Art::Genre.create(name: genre)
  end

  scene = Art::Category.create(name: "Scene")
  character = Art::Category.create(name: "Character")
  environment = Art::Category.create(name: "Environment")
  vehicle = Art::Category.create(name: "Vehicle")

  %w(Action Intimate Group).each do |sub|
    scene.art_subcategories.create(name: sub)
  end

  %w(Beast Human Hybrid).each do |sub|
    character.art_subcategories.create(name: sub)
  end

  %w(Interior Exterior).each do |sub|
    environment.art_subcategories.create(name: sub)
  end

  %w(Military Civilian Flying).each do |sub|
    vehicle.art_subcategories.create(name: sub)
  end

  %w(Ugly Old Fire Sexy Clear Laughing Rugged Furry Water Tall Secret Slimy Loud Gory Rigid Sinister Magical Heavy Colorful).each do |detail|
    Art::Detail.create(name: detail)
  end
end
