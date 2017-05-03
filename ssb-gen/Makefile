all: target/lib/dbgen.jar target/ssb-gen-1.0-SNAPSHOT.jar

target/ssb-gen-1.0-SNAPSHOT.jar: $(shell find . -name *.java) 
	mvn package

target/tools: ssb-dbgen/README
	mkdir -p target/tools/
	cp -avf ssb-dbgen/* target/tools/

target/tools/dbgen: target/tools
	cd target/tools/; make dbgen CC=gcc DATABASE=ORACLE MACHINE=LINUX WORKLOAD=SSBM

target/lib/dbgen.jar: target/tools/dbgen
	cd target/; mkdir -p lib/; ( jar cvf lib/dbgen.jar tools/ || gjar cvf lib/dbgen.jar tools/ )

clean:
	rm -rf target
	mvn clean
