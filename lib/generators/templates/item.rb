module Dota2Constant
  class Item < ApplicationRecord
    self.table_name = "dota2_items"
    
    before_create do
      self.lg_avatar = "https://rw-assets.oss-cn-hangzhou.aliyuncs.com/dota2/items/#{self.en_name}_lg.png"
      self.eg_avatar = "https://rw-assets.oss-cn-hangzhou.aliyuncs.com/dota2/items/#{self.en_name}_eg.png"
    end

    def self.load_yml(default_path = (Rails.root.to_s + "/lib/constants/items.yml"))
      items = YAML.load_file(default_path)
      items.each_pair do |key, value|
        self.create(steam_id: key.to_i, en_name: value.to_s)
      end
    end
  end
end