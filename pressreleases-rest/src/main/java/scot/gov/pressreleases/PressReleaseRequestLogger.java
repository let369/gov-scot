package scot.gov.pressreleases;

import org.apache.commons.lang.time.StopWatch;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.ws.rs.container.ContainerRequestContext;
import javax.ws.rs.container.ContainerRequestFilter;
import javax.ws.rs.container.ContainerResponseContext;
import javax.ws.rs.container.ContainerResponseFilter;
import java.io.IOException;

public class PressReleaseRequestLogger implements ContainerRequestFilter, ContainerResponseFilter {

    private static final Logger LOG = LoggerFactory.getLogger(PressReleaseRequestLogger.class);

    /**
     * Runs before the request is processed.
     *
     * Adds the user to the MDC and adds a started stopwatch to the request context.
     */
    @Override
    public void filter(ContainerRequestContext requestContext) throws IOException {
        StopWatch stopwatch = new StopWatch();
        requestContext.setProperty("stopwatch", stopwatch);
        stopwatch.start();
    }

    /**
     * Runs after the request has been processed.
     *
     * Removes the user from the MDC and logs the request details
     */
    @Override
    public void filter(ContainerRequestContext request, ContainerResponseContext response) throws IOException {
        String method = request.getRequest().getMethod();
        String path = request.getUriInfo().getPath();
        int status = response.getStatus();
        StopWatch stopWatch = (StopWatch) request.getProperty("stopwatch");
        if (stopWatch != null) {
            stopWatch.stop();
            LOG.info("{} {} {} {}", status, method, path, stopWatch.getTime());
        } else {
            LOG.info("{} {} {}", status, method, path);
        }
    }
}