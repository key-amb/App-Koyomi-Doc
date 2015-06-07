.PHONY: site server publish
publish: site

site:
	hugo

server:
	hugo server -w

publish:
	./publish.sh
