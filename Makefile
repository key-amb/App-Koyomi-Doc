.PHONY: site server publish publish-old

site:
	hugo

server:
	hugo server -w

publish:
	rm -rf public/*
	hugo
	cd public && git add . \
		&& git commit -m "make publish" \
		&& git push origin gh-pages

publish-old: site
	./publish.sh
