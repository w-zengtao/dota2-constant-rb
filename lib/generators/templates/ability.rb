module Dota2Constant
  class Ability < ApplicationRecord
    self.table_name = "dota2_abilities"
    
    before_create do
      self.lg_avatar = "http://rw-assets.oss-cn-hangzhou.aliyuncs.com/dota2/abilities/#{self.en_name}_lg.png"
      self.md_avatar = "http://rw-assets.oss-cn-hangzhou.aliyuncs.com/dota2/abilities/#{self.en_name}_md.png"
      self.sm_avatar = "http://rw-assets.oss-cn-hangzhou.aliyuncs.com/dota2/abilities/#{self.en_name}_sm.png"
    end

    def self.load_yml(default_path = (Rails.root.to_s + "/lib/constants/abilities.yml"))
      abilities = YAML.load_file(default_path)
      abilities.each_pair do |key, value|
        self.create(steam_id: key.to_i, en_name: value.to_s)
      end
    end
  end
end
