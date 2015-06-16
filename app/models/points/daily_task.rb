class Points::DailyTask < ActiveRecord::Base
  before_save :parse_tasks

  attr_accessor :task_string

  COMPLETE_MARKER = '|'

  def task_display
    tasks.present? ? clear_tasks.join(', ') : nil
  end

  def clear_tasks
    tasks.map{ |t| self.class.clear(t) }
  end

  def self.clear(task)
    task.gsub(COMPLETE_MARKER, '')
  end


  def self.completed?(task)
    task.include?(COMPLETE_MARKER)
  end

  def parse_tasks
    Rails.logger.info task_string
    return unless task_string.present?
    self.tasks = task_string.split(',').map(&:strip)
  end
end
