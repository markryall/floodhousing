export HEROKU_TEST=floodhousingtest
alias gpush="git push origin master"
alias gpull="git pull origin master"
alias dtest="git push heroku-${HEROKU_TEST} master; heroku rake db:migrate --app ${HEROKU_TEST}; heroku restart --app ${HEROKU_TEST}"
alias dprod="git push heroku master; heroku rake db:migrate --app floodhousing; heroku restart --app floodhousing"
alias go="rake db:migrate; open http://localhost:3000; rails server"