namespace :backup do
  desc "Backup Database"
  task db: :environment do
    backup_directory = "#{Rails.application.secrets.backup_directory}"
    config           = Rails.configuration.database_configuration
    host             = config[Rails.env]["host"]
    database         = config[Rails.env]["database"]
    username         = config[Rails.env]["username"]
    password         = config[Rails.env]["password"]

    puts "Dumping #{database} database..."
    if username.present?
      system "PGPASSWORD=#{password} pg_dump -h #{host} -U #{username} #{database} > #{Time.now.strftime('%y%m%d')}-#{database}.sql"
    else
      system "pg_dump #{database} > #{backup_directory}/#{Time.now.strftime('%y%m%d')}-#{database}.sql"
    end
  end

end
