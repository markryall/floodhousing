alias gpush="git push origin master --tags"
alias gpull="git pull origin master --tags"
alias dtest="git push git@heroku.com:${HEROKU_TEST}.git master; heroku rake db:migrate --app ${HEROKU_TEST}; heroku restart --app ${HEROKU_TEST}"
alias go="rake db:migrate; open http://localhost:3000; rails server"