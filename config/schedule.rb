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
every 51.minutes do
  rake "china"
end
every 53.minutes do
  rake "international"
end

every 55.minutes do
  rake "japan_oceania"
end

every 56.minutes do
  rake "korea"
end

every 57.minutes do
  rake "sfp"
end

every 58.minutes do
  rake "taiwan_thailand"
end

every 59.minutes do
  rake "vmi"
end