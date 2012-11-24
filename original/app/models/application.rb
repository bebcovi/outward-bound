class Application < ActiveRecord::Base
  belongs_to :course

  serialize :sports, Hash
  serialize :contact, Hash
  serialize :health, Hash

  validates_presence_of :course, :starts_at, :first_name, :last_name
  validates_numericality_of :height, :weight, :passport_number, :postal_code,
    :phone_number, :mobile_number, :boot_size, allow_blank: true
  validates_acceptance_of :accept

  before_create do
    health.each do |key, value|
      value.unshift("no") if value.size == 1
    end
  end

  def country
    I18n.t("countries.#{read_attribute(:country)}") if read_attribute(:country).present?
  end

  def name
    "#{first_name} #{last_name}"
  end

  def insurance
    case read_attribute(:insurance)
    when true
      I18n.t("words.y")
    when false
      I18n.t("words.n")
    end
  end
end
