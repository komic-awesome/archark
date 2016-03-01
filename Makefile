s: server

p: publish

server:
	bundle exec middleman server

publish:
	bundle exec rake publish REMOTE_NAME=origin BRANCH_NAME=gitcafe-pages
