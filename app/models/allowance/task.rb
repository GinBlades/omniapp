class Allowance::Task < ActiveRecord::Base
  belongs_to :user
  validates :user_id, :goal, :reward, presence: true
  after_save :pay_up

  def pay_up
    return unless days.sort == [0, 1, 2, 3, 4, 5, 6]

    user.allowance_entries.create(
      payee: user.first_name,
      category: "Allowance Task",
      entry_date: Time.zone.now,
      price: -10
    )
    update_attributes(days: [])
  end
end
