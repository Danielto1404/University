package info.kgeorgiy.java.advanced.implementor;

import java.nio.file.Path;

/**
 * @author Georgiy Korneev (kgeorgiy@kgeorgiy.info)
 */
public interface Impler {
    /**
     * Produces code implementing class or interface specified by provided token.
     * 
     * Generated class classes name should be same as classes name of the type token with Impl suffix
     * added. Generated source code should be placed in the correct subdirectory of the specified
     * root directory and have correct file name. For example, the implementation of the
     * interface {@link java.util.List} should go to $root/java/util/ListImpl.java
     *
     *
     * @param token type token to create implementation for.
     * @param root root directory.
     * @throws info.kgeorgiy.java.advanced.implementor.ImplerException when implementation cannot be
     * generated.
     */
    void implement(Class<?> token, Path root) throws ImplerException;
}