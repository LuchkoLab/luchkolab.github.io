.PHONY: image serve shell

image:
	./scripts/jekyll-container.sh build

serve:
	./scripts/jekyll-container.sh serve

shell:
	./scripts/jekyll-container.sh shell