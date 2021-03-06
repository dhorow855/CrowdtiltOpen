all:
	RAILS_ENV=production bundle exec foreman start;

stop:
	cat tmp/unicorn.pid | xargs kill -QUIT ;

restart:
	make stop; make;

logs:
	tail -f log/unicorn.log;

assets:
	RAILS_ENV=production  bundle exec foreman run rake assets:precompile


local:
	bundle exec foreman run unicorn -p 5000 -c ./config/unicorn.rb

