import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;

import static org.hamcrest.core.Is.is;
import static org.junit.Assert.assertThat;

public class HelloWorldTest {

	private ByteArrayOutputStream outContent = new ByteArrayOutputStream();

	@Before
	public void willRedirectSysOut() {
		System.setOut(new PrintStream(outContent));
	}

	@After
	public void willRedirectBackSysOut() {
		System.setOut(null);
	}

	@Test
	public void shouldReturnHelloWorld() throws Exception {

		HelloWorld helloWorld = new HelloWorld(System.out);
		helloWorld.write("Hello World!");

		assertThat(outContent.toString(), is("Hello World!\n"));
	}

	@Test
	public void shouldReturnHalloWelt() {

		HelloWorld helloWorld = new HelloWorld(System.out);
		helloWorld.write("Hallo Welt!");

		assertThat(outContent.toString(), is("Hallo Welt!\n"));
	}

}
