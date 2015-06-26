class Budget::Event < ActiveRecord::Base
  belongs_to :budget_payee, class_name: "::Budget::Payee"
  attr_accessor :alert_before
  enum recurring_interval: [:one_week, :two_weeks, :month, :year]

  before_save :set_alert_date

  def self.before_times
    [["None", ""], ["On Time", 0], ["One Day", 1], ["One Week", 7], ["One Month", 30]]
  end

  def alert_difference
    alert_date ? (event_date - alert_date).to_i : nil
  end

  private

  def set_alert_date
    if alert_before.blank?
      self.alert_date = nil
    else
      self.alert_date = event_date - alert_before.to_i.days
    end
  end
end
