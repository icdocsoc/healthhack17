PUG=pug
HEAD_REV=$(shell git rev-parse HEAD)

all: update build

setup:
	npm install -g pug-cli
	npm install

update:
	npm install
	npm update

build:
	mkdir -p ./build
	$(PUG) index.pug -o ./build
	cp -R css ./build/css
	cp -R js ./build/js
	cp -R images ./build/images

deploy: build
	rm -rf build/.git
	git -C build init .
	git -C build fetch "git@github.com:ichealthhack/ichealthhack.github.io.git" master
	git -C build reset --soft FETCH_HEAD
	git -C build add .
	if ! git -C build diff-index --quiet HEAD ; then \
		git -C build commit -m "Deploy ichealthhack/healthhack17@${HEAD_REV}" && \
		git -C build push "git@github.com:ichealthhack/ichealthhack.github.io.git" master:master ; \
		fi
	cd ..

clean:
	rm -rf ./build
