
.PHONY: fmt format check test

fmt:
	cue fmt --files arm5/
format: fmt

check:
	cue vet -c=false ./arm5

test:
	find ./tests/valid/ -type f -print -exec cue vet -c ./arm5 {} \;