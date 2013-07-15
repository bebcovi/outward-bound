class AlbumDecorator < Draper::Decorator
  delegate_all
  translates :name
end
