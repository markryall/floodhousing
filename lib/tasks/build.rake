
desc "run the full build"
task :build => ["db:migrate", "spec", "cucumber:all"]