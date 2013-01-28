# Flood Housing

## Create your very own instance

    heroku apps:create
    heroku addons:add heroku-postgresql
    heroku pg:promote HEROKU_POSTGRESQL_NAVY_URL
    heroku addons:add sendgrid:starter
    git push heroku master