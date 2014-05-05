module SpreeCustomImages
  module Generators
    class InstallGenerator < Rails::Generators::Base

      class_option :auto_run_migrations, :type => :boolean, :default => false

      def add_javascripts
        append_file 'vendor/assets/javascripts/spree/frontend/all.js', "//= require spree/frontend/spree_custom_images\n"
        append_file 'vendor/assets/javascripts/spree/backend/all.js', "//= require spree/backend/spree_custom_images\n"
      end

      def add_stylesheets
        inject_into_file 'vendor/assets/stylesheets/spree/frontend/all.css', " *= require spree/frontend/spree_custom_images\n", :before => /\*\//, :verbose => true
        inject_into_file 'vendor/assets/stylesheets/spree/backend/all.css', " *= require spree/backend/spree_custom_images\n", :before => /\*\//, :verbose => true
      end

      def copy_images
        install_path = File.expand_path(File.dirname(__FILE__))
        src_path = File.expand_path("images", File.dirname(File.dirname(File.dirname(File.dirname(install_path)))))
        dst_path = File.expand_path("images", Dir.pwd)
        FileUtils.copy_entry(src_path, dst_path)
      end

      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=spree_custom_images'
      end

      def run_migrations
        run_migrations = options[:auto_run_migrations] || ['', 'y', 'Y'].include?(ask 'Would you like to run the migrations now? [Y/n]')
        if run_migrations
          run 'bundle exec rake db:migrate'
        else
          puts 'Skipping rake db:migrate, don\'t forget to run it!'
        end
      end
    end
  end
end
