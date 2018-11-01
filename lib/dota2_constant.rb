require "dota2_constant/version"

module Dota2Constant
  def self.exec
    Ability.load_yml
    Item.load_yml
    Hero.load_yaml
  end
end
