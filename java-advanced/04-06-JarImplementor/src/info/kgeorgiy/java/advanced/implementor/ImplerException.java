package info.kgeorgiy.java.advanced.implementor;

/**
 * Thrown by {@link Impler} when an error occurred.
 *
 * @author Georgiy Korneev (kgeorgiy@kgeorgiy.info)
 */
public class ImplerException extends Exception {

    public ImplerException(final String message) {
        super(message);
    }

    public ImplerException(final String message, final Throwable cause) {
        super(message, cause);
    }

    public ImplerException(final Throwable cause) {
        super(cause);
    }
}
