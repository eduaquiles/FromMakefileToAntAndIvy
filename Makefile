all: tests run

compile-fonts: src/HelloWorld.java
	mkdir -p target
	javac -d target src/HelloWorld.java
	jar cvfe target/HelloWorld.jar HelloWorld -C target HelloWorld.class
	rm target/*.class

tests: compile-fonts junit run-tests

junit: 
	wget -c -P lib https://github.com/downloads/KentBeck/junit/junit-4.8.2.jar

run-tests: compile-tests
	java -cp target/*:lib/*:tests-target/*: org.junit.runner.JUnitCore HelloWorldTest

compile-tests: 
	mkdir -p tests-target
	javac -cp src/*:target/*:lib/* -d tests-target test/HelloWorldTest.java
	jar cvf tests-target/HelloWorldTest.jar -C tests-target HelloWorldTest.class
	rm tests-target/*.class

run: target/HelloWorld.jar
	java -cp target/* HelloWorld
