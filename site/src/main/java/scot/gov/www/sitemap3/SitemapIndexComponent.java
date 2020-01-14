package scot.gov.www.sitemap3;

import org.apache.commons.lang.time.StopWatch;
import org.hippoecm.hst.content.beans.query.HstQuery;
import org.hippoecm.hst.content.beans.query.HstQueryResult;
import org.hippoecm.hst.content.beans.query.exceptions.QueryException;
import org.hippoecm.hst.core.component.HstComponentException;
import org.hippoecm.hst.core.component.HstRequest;
import org.hippoecm.hst.core.component.HstResponse;
import org.onehippo.forge.sitemap.components.model.sitemapindex.SitemapIndex;
import org.onehippo.forge.sitemap.components.model.sitemapindex.TSitemap;
import org.onehippo.forge.sitemap.generator.SitemapIndexGenerator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import scot.gov.www.sitemap.BaseSitemapComponent;

/**
 * Component that generates a sitemap index file for a site.
 *
 * Does this by splitting the pages into chunkc of size MAX_SITEMAP_SIZE
 */
public class SitemapIndexComponent extends BaseSitemapComponent {

    private static final Logger LOG = LoggerFactory.getLogger(SitemapIndexComponent.class);

    @Override
    public void doBeforeRender(HstRequest request, HstResponse response) {
        super.doBeforeRender(request, response);

        LOG.info("Generating sitemap index for {}", request.getPathInfo());
        StopWatch stopWatch = new StopWatch();
        stopWatch.start();

        try {
            SitemapIndex sitemapIndex = generateSitemap(request);
            request.setAttribute("sitemap", SitemapIndexGenerator.toString(sitemapIndex));
            LOG.info("Finished generating sitemap index {} pages, took {} millis",
                    request.getPathInfo(), sitemapIndex.getSitemap().size(), stopWatch.getTime());
        } catch (QueryException e) {
            LOG.error("Failed top generate sitemap index", e);
            throw new HstComponentException(e);
        }
    }

    HstQuery allPagesQuery(HstRequest request) {
        return allPagesQuery(request, 0, 1);
    }

    SitemapIndex generateSitemap(HstRequest request) throws QueryException {
        HstQuery query = allPagesQuery(request);
        HstQueryResult result = query.execute();
        SitemapIndex sitemapIndex = new SitemapIndex();
        int count = (result.getTotalSize() / MAX_SITEMAP_SIZE) + 1;
        for (int i = 0; i < count; i++) {
            sitemapIndex.getSitemap().add(tsitemap(request, i));
        }
        return sitemapIndex;
    }

    TSitemap tsitemap(HstRequest request, int i) {
        TSitemap sitemap = new TSitemap();
        String filename = String.format("sitemap_%d.xml", i);
        sitemap.setLoc(createLink(request, filename));
        return sitemap;
    }

}
