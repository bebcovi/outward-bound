class AddStatueText < ActiveRecord::Migration
  class Text < ActiveRecord::Base
  end

  def up
    Text.create!(controller: "about", action: "statute")
  end

  def down
    Text.find_by(controller: "about", action: "statute").destroy
  end
end
