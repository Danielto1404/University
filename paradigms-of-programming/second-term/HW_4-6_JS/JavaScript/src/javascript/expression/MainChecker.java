package javascript.expression;

import java.io.*;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.URL;
import java.net.URLClassLoader;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Georgiy Korneev (kgeorgiy@kgeorgiy.info)
 */
public class MainChecker extends Randomized {
    public static final String ENCODING = "utf8";
    private final Method method;
    protected final TestCounter counter = new TestCounter();

    public MainChecker(final String className) {
        try {
            final URL url = new File(".").toURI().toURL();
            final Class<?> clazz = new URLClassLoader(new URL[]{url}).loadClass(className);
//            clazz.newInstance();
            method = clazz.getMethod("main", String[].class);
        } catch (final Exception e) {
            throw new AssertionError("Could not found main(String[]) in class "  + className, e);
        }
    }

    public List<String> run(final String... input) {
        counter.nextTest();
        System.err.format("Running test %02d: java %s \"%s\"\n", counter.getTest(), method.getDeclaringClass().getName(), join(input));
        final ByteArrayOutputStream out = new ByteArrayOutputStream();
        final PrintStream oldOut = System.out;
        try {
            System.setOut(new PrintStream(out, false, ENCODING));
            method.invoke(null, new Object[]{input});
            final BufferedReader reader = new BufferedReader(new InputStreamReader(new ByteArrayInputStream(out.toByteArray()), ENCODING));
            final List<String> result = new ArrayList<>();
            while (true) {
                final String line = reader.readLine();
                if (line == null) {
                    if (result.isEmpty()) {
                        result.add("");
                    }
                    return result;
                }
                result.add(line.trim());
            }
        } catch (final InvocationTargetException e) {
            throw new AssertionError(e.getCause());
        } catch (final Exception e) {
            throw new AssertionError(e);
        } finally {
            System.setOut(oldOut);
        }
    }

    private String join(final String[] input) {
        final StringBuilder sb = new StringBuilder();
        for (final String s : input) {
            if (sb.length() > 0) {
                sb.append("\" \"");
            }
            sb.append(s);
        }
        return sb.toString();
    }

    public void checkEquals(final List<String> expected, final List<String> actual) {
        for (int i = 0; i < Math.min(expected.size(), actual.size()); i++) {
            final String exp = expected.get(i);
            final String act = actual.get(i);
            if (!exp.equalsIgnoreCase(act)) {
                Asserts.assertEquals("Line " + (i + 1), exp, act);
                return;
            }
        }
        Asserts.assertEquals("Number of lines", expected.size(), actual.size());
        counter.passed();
    }

    public void printStatus() {
        counter.printStatus(getClass());
    }
}