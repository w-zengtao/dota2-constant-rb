require 'rails/generators'
require 'rails/generators/migration'

class Dota2ConstantGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  def self.source_root
    @source_root ||= File.join(File.dirname(__FILE__), 'templates')
  end

  def self.next_migration_number(dirname)
    Time.now.utc.strftime("%Y%m%d%H%M%S")
  end

  def create_migration_file
    migration_template 'constant_migration.rb', 'db/migrate/create_dota2_constant.rb'
  end

  def create_model
    template "item.rb", File.join('app/models/dota2_constant', "item.rb")
    template "hero.rb", File.join('app/models/dota2_constant', "hero.rb")
    template "ability.rb", File.join('app/models/dota2_constant', "ability.rb")
  end
end