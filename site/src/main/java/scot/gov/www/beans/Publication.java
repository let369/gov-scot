package scot.gov.www.beans;

import org.onehippo.cms7.essentials.dashboard.annotations.HippoEssentialsGenerated;
import org.hippoecm.hst.content.beans.Node;
import java.util.List;
import org.hippoecm.hst.content.beans.standard.HippoResourceBean;
import org.hippoecm.hst.content.beans.standard.HippoHtml;
import java.util.Calendar;

@HippoEssentialsGenerated(internalName = "govscot:Publication")
@Node(jcrType = "govscot:Publication")
public class Publication extends AttributableContent {
    @HippoEssentialsGenerated(internalName = "govscot:isbn")
    public String getIsbn() {
        return getProperty("govscot:isbn");
    }

    @HippoEssentialsGenerated(internalName = "govscot:title")
    public String getTitle() {
        return getProperty("govscot:title");
    }

    @HippoEssentialsGenerated(internalName = "govscot:summary")
    public String getSummary() {
        return getProperty("govscot:summary");
    }

    @HippoEssentialsGenerated(internalName = "govscot:seoTitle")
    public String getSeoTitle() {
        return getProperty("govscot:seoTitle");
    }

    @HippoEssentialsGenerated(internalName = "govscot:metaDescription")
    public String getMetaDescription() {
        return getProperty("govscot:metaDescription");
    }

    @HippoEssentialsGenerated(internalName = "hippostd:tags")
    public String[] getTags() {
        return getProperty("hippostd:tags");
    }

    @HippoEssentialsGenerated(internalName = "govscot:content")
    public HippoHtml getContent() {
        return getHippoHtml("govscot:content");
    }

    @HippoEssentialsGenerated(internalName = "govscot:notes")
    public HippoHtml getNotes() {
        return getHippoHtml("govscot:notes");
    }

    @HippoEssentialsGenerated(internalName = "govscot:images")
    public List<HippoResourceBean> getImages() {
        return getChildBeansByName("govscot:images", HippoResourceBean.class);
    }

    @HippoEssentialsGenerated(internalName = "govscot:publicationDate")
    public Calendar getPublicationDate() {
        return getProperty("govscot:publicationDate");
    }

    @HippoEssentialsGenerated(internalName = "govscot:publicationType")
    public String getPublicationType() {
        return getProperty("govscot:publicationType");
    }
}
