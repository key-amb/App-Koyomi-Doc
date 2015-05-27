.PHONY: site server publish

site:
	hugo

server:
	hugo server -w

publish:
	./publish.sh
