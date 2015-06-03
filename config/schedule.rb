# If you need Rails loaded
# require File.expand_path(File.dirname(__FILE__) + '/environment')

# For just rails root
RAILS_ROOT = File.dirname(__FILE__) + '/..'

# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
env :PATH, ENV['PATH']
set :environment, ENV['RAILS_ENV']
set :output, "~/logs/omniapp-cron.log"

every 1.week, at: '1:30am' do
  rake 'backup:db'
end

every 1.month, at: 'start of the month at 1am' do
  rake 'budget:allowance'
end
