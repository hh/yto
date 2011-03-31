require 'refinerycms-base'

module Refinery
  module Trainings
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "trainings"
          plugin.activity = {
            :class => Training,
            :title => 'focus'
          }
        end
      end
    end
  end
end
