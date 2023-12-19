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
