class Reader < ActiveRecord::Base
  has_many :subscriptions
  has_many :magazines, through: :subscriptions

  def subscribe(magazine, price)
    self.subscriptions.create(magazine_id: magazine.id, price: price)
  end

  def total_subscription_price
    self.subscriptions.sum(:price)
  end

  def cancel_subscription(magazine)
    s = self.subscriptions.find_by(magazine_id: magazine.id)
    s.destroy
    #self.subscriptions.destroy(s)
  end

end