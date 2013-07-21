require_relative "20130626132524_create_friendly_id_slugs"

class RemoveFriendlyId < ActiveRecord::Migration
  def change
    revert CreateFriendlyIdSlugs
  end
end
