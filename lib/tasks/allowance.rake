namespace :allowance do
  desc "Convert budget entries to allowance entries."
  task convert: :environment do
    Budget::Entry.all.each do |entry|
      Allowance::Entry.create(
        user: entry.user,
        payee: entry.budget_payee.try(:name),
        category: entry.budget_subcategory.try(:label),
        entry_date: entry.entry_date,
        price: entry.price,
        notes: entry.notes
      )
    end
  end

  desc "Monthly allowance update"
  task monthly: :environment do
    User.all.each do |user|
      user.allowance_entries.create(
        payee: user.first_name,
        category: "Allowance",
        entry_date: Time.zone.now,
        price: -100
      )
    end
  end
end
