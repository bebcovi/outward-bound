class LocationDecorator < Draper::Decorator
  delegate_all
  translates :name, :description

  def name
    smarty_pants super
  end

  def description
    markdown super
  end
end
