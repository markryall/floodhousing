# Flood Housing

## Create your very own instance

    heroku apps:create
    heroku addons:add heroku-postgresql
    heroku pg:promote <name of heroku postgres db>
    heroku addons:add sendgrid:starter
    heroku config:add HOST_FOR_EMAIL_LINKS=<application hostname and port>
    git push heroku master
    heroku run rake db:migrate
    heroku ps:restart