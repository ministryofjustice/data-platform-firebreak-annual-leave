.PHONY: test

run:
	bin/dev

serve:
	bin/dev

test: 
	rails t -v

test-system:
	rails test:system

db-setup:
	rails db:seed

db-fresh:
	rails db:drop db:create db:migrate db:seed

autocorrect:
	rubocop --auto-correct && standard --fix

local-db-connect:
	psql --user annual_leave --host 127.0.0.1