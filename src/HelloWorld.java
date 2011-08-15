import java.io.PrintStream;

public class HelloWorld {

	private final PrintStream output;

	public HelloWorld(PrintStream output) {
		this.output = output;
	}

	public void write(String message) {
		output.println(message);
	}

	public static void main(String[] args) {
		HelloWorld helloWorld = new HelloWorld(System.out);
		helloWorld.write("Hello World!");
	}

}
