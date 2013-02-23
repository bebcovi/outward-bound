class EmailForward < ActiveRecord::Base
  validates :uid, uniqueness: true
  validates :to,  uniqueness: {scope: :from}

  default_scope  ->         { order(:from).order(:to) }
  scope :from,   ->(emails) { where(from: emails) }
  scope :to,     ->(emails) { where(to: emails) }
  scope :search, ->(query)  { where{(to =~ "%#{query}%") | (from =~ "%#{query}%")} }

  def from=(value)
    write_attribute(:from, value.sub(/@.+$/, ""))
  end
end
