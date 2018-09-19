package scot.gov.www.components;

import org.hippoecm.hst.component.support.bean.BaseHstComponent;
import org.hippoecm.hst.core.component.HstRequest;
import org.hippoecm.hst.core.component.HstResponse;

public class BetaBannerComponent extends BaseHstComponent {

    @Override
    public void doBeforeRender(HstRequest request, HstResponse response) {
        super.doBeforeRender(request, response);

        String hostGroup = request
                .getRequestContext()
                .getResolvedMount()
                .getMount()
                .getVirtualHost()
                .getHostGroupName();

        boolean showBetaBanner = hostGroup.endsWith("beta");
        if (showBetaBanner) {
            request.setAttribute("showBetaBanner", true);
        }
    }

}
