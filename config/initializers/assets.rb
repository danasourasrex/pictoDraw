# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.precompile += %w( liveline.js )
Rails.application.config.assets.precompile += %w( timeline.js )
Rails.application.config.assets.precompile += %w( wordline.js )

Rails.application.config.assets.precompile += %w( style.css )
Rails.application.config.assets.precompile += %w( materialize.css )
Rails.application.config.assets.precompile += %w( background1.jpg )
Rails.application.config.assets.precompile += %w( background1.png )
Rails.application.config.assets.precompile += %w( background2.jpg )
Rails.application.config.assets.precompile += %w( background3.jpg )
Rails.application.config.assets.precompile += %w( init.js )
Rails.application.config.assets.precompile += %w( materialize.js )
Rails.application.config.assets.precompile += %w( loginbackdrop.jpg)

Rails.application.config.assets.precompile += %w( hilight1.png)
Rails.application.config.assets.precompile += %w( hilight2.png)
Rails.application.config.assets.precompile += %w( hilight3.png)
Rails.application.config.assets.precompile += %w( hilight4.png)


#Rails.application.config.assets.precompile += %w( drawing.js )
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
