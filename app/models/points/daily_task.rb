class Points::DailyTask < ActiveRecord::Base
  belongs_to :user
  before_save :parse_tasks
  before_save :update_success

  attr_accessor :task_string

  COMPLETE_MARKER = "|"

  def task_display
    tasks.present? ? clear_tasks.join(", ") : nil
  end

  def clear_tasks
    tasks.map { |t| self.class.clear(t) }
  end

  def parse_tasks
    Rails.logger.info task_string
    return unless task_string.present?
    self.tasks = task_string.split(",").map(&:strip)
  end

  def percent_completed
    completed_tasks = tasks.count { |t| t.include?(COMPLETE_MARKER) }
    (completed_tasks / tasks.length.to_f) * 100
  end

  class << self
    def swap_completed(task)
      task.include?(COMPLETE_MARKER) ? clear(task) : "#{task}|"
    end

    def update_task(task, completed)
      completed ? "#{clear(task)}|" : clear(task)
    end

    def clear(task)
      task.gsub(COMPLETE_MARKER, "")
    end

    def completed?(task)
      task.include?(COMPLETE_MARKER)
    end
  end

  protected

  def update_success
    self.success = (percent_completed).to_i
  end
end
