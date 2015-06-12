namespace :budget do
  desc 'Refresh allowance'
  task allowance: :environment do
    User.all.each do |user|
      user.past_allowance += user.current_allowance
      user.current_allowance = 100.0
      user.save
    end
  end
end
