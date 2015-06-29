namespace :points do
  desc "Update todays tasks based on yesterdays"
  task daily_update: :environment do

    Rails.logger.info "*" * 30
    Rails.logger.info "Running daily update at: #{Time.zone.now}"
    Rails.logger.info "Server Time: #{Time.now}"
    yesterdays_tasks = ::Points::DailyTask.where(entry_date: 1.day.ago.to_date)
    return if yesterdays_tasks == 0
    yesterdays_tasks.each do |task_list|
      Rails.logger.info "Yesterdays task entry date: #{task_list.entry_date}"
      ::Points::DailyTask.create(
        user: task_list.user,
        entry_date: Time.zone.today,
        tasks: task_list.clear_tasks
      )
    end
  end
end
