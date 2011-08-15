all: run

compile-fonts: src/HelloWorld.java
	mkdir -p target
	javac -d target src/HelloWorld.java

src-jar: compile-fonts
	jar cvfe target/HelloWorld.jar HelloWorld -C target HelloWorld.class
	rm target/*.class

tests: run-tests

junit: 
	wget -c -P lib https://github.com/downloads/KentBeck/junit/junit-4.8.2.jar

run-tests: tests-jar
	java -cp target/*:lib/*:tests-target/*: org.junit.runner.JUnitCore HelloWorldTest

compile-tests: junit src-jar
	mkdir -p tests-target
	javac -cp target/*:lib/* -d tests-target test/HelloWorldTest.java

tests-jar: compile-tests
	jar cvf tests-target/HelloWorldTest.jar -C tests-target HelloWorldTest.class
	rm tests-target/*.class

run: run-tests
	java -cp target/* HelloWorld

clean:
	rm -rf target tests-target

