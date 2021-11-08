package scot.gov.www.components;

import org.hippoecm.hst.configuration.components.HstComponentConfiguration;
import org.hippoecm.hst.core.component.HstRequest;
import org.hippoecm.hst.core.component.HstResponse;
import org.hippoecm.hst.core.parameters.ParametersInfo;
import org.hippoecm.hst.core.sitemenu.HstSiteMenu;
import org.hippoecm.hst.core.sitemenu.HstSiteMenuItem;
import org.onehippo.cms7.essentials.components.EssentialsMenuComponent;
import org.onehippo.cms7.essentials.components.info.EssentialsMenuComponentInfo;

import static org.apache.commons.lang3.StringUtils.equalsAny;

/**
 * Subclass the standard menu component in order to feature flag items.
 */
@ParametersInfo(type = EssentialsMenuComponentInfo.class)
public class MainMenu extends EssentialsMenuComponent {

    @Override
    public void doBeforeRender(final HstRequest request, final HstResponse response) {
        super.doBeforeRender(request, response);

        HstSiteMenu menu = (HstSiteMenu) request.getAttribute("menu");
        if (menu == null) {
            return;
        }

        // set feature flags for site items
        for (HstSiteMenuItem siteMenuItem : menu.getSiteMenuItems()) {
            String flagName = flagname(siteMenuItem);
            boolean enabled = FeatureFlags.isEnabled(flagName, request.getRequestContext(), true);
            request.setAttribute(flagName, enabled);
        }

        HstComponentConfiguration componentConfig = request
                .getRequestContext()
                .getResolvedSiteMapItem()
                .getHstComponentConfiguration();
        String formatName = componentConfig.getName();

        // hide search for home or search pages
        request.setAttribute("hideSearch", equalsAny(formatName, "homepage", "searchpage"));
    }

    String flagname(HstSiteMenuItem menuItem) {
        return menuItem.getName().replaceAll(" ", "") + "Menu";
    }
}
