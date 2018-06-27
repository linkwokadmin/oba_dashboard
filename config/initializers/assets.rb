# Be sure to restart your server when you modify this file.

Rails.application.configure do
    # Version of your assets, change this if you want to expire all your assets.
    config.assets.version = '1.0'

    # Add additional assets to the asset load path.
    # Rails.application.config.assets.paths << Emoji.images_path
    # Add Yarn node_modules folder to the asset load path.
    config.assets.paths << Rails.root.join('node_modules')

    # Precompile additional assets.
    # application.coffee, application.scss, and all non-JS/CSS in the app/assets
    # folder are already added.
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
    config.assets.precompile += %w( devise.coffee devise.scss )
    config.assets.precompile += %w( controllers.coffee )
end