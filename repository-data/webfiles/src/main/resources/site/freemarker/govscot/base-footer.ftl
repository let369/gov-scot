<#include "../include/imports.ftl">
<@hst.webfile var="iconspath" path="/assets/images/icons/icons.stack.svg"/>

<#-- @ftlvariable name="item" type="scot.gov.www.beans.SiteItem" -->
<#-- @ftlvariable name="pageable" type="org.onehippo.cms7.essentials.components.paging.Pageable" -->

<footer class="ds_site-footer  ds_reversed">
    <aside class="gov_secondary-footer">
        <div class="ds_wrapper">
            <h2 class="visually-hidden">
                Follow The Scottish Government
            </h2>
            <ul class="gov_social-links">
                <li class="gov_social-links__item">
                    <a title="Facebook" class="gov_social-links__link" href="https://www.facebook.com/TheScottishGovernment/timeline/" data-footer="social-1">
                        <div class="gov_social-links__link-inner">
                            <span class="visually-hidden">Facebook</span>
                            <svg class="ds_icon  ds_icon--16" aria-hidden="true" role="img"><use xlink:href="${iconspath}#facebook"></use></svg>
                        </div>
                    </a>
                </li>
                <li class="gov_social-links__item">
                    <a title="Twitter" class="gov_social-links__link" href="https://twitter.com/scotgov" data-footer="social-2">
                        <div class="gov_social-links__link-inner">
                            <span class="visually-hidden">Twitter</span>
                            <svg class="ds_icon  ds_icon--16" aria-hidden="true" role="img"><use xlink:href="${iconspath}#twitter"></use></svg>
                        </div>
                    </a>
                </li>
                <li class="gov_social-links__item">
                    <a title="Flickr" class="gov_social-links__link" href="https://www.flickr.com/photos/26320652@N02" data-footer="social-3">
                        <div class="gov_social-links__link-inner">
                            <span class="visually-hidden">Flickr</span>
                            <svg class="ds_icon  ds_icon--16" aria-hidden="true" role="img"><use xlink:href="${iconspath}#flickr"></use></svg>
                        </div>
                    </a>
                </li>
                <li class="gov_social-links__item">
                    <a title="YouTube" class="gov_social-links__link" href="https://www.youtube.com/user/scottishgovernment" data-footer="social-4">
                        <div class="gov_social-links__link-inner">
                            <span class="visually-hidden">YouTube</span>
                            <svg class="ds_icon  ds_icon--16" aria-hidden="true" role="img"><use xlink:href="${iconspath}#youtube"></use></svg>
                        </div>
                    </a>
                </li>
                <li class="gov_social-links__item">
                    <a title="Instagram" class="gov_social-links__link" href="https://www.instagram.com/scotgov/" data-footer="social-5">
                        <div class="gov_social-links__link-inner">
                            <span class="visually-hidden">Instagram</span>
                            <svg class="ds_icon  ds_icon--16" aria-hidden="true" role="img"><use xlink:href="${iconspath}#instagram"></use></svg>
                        </div>
                    </a>
                </li>
            </ul>
        </div>
    </aside>

    <div class="ds_wrapper">
        <div class="ds_site-footer__content">
            <ul class="ds_site-footer__site-items">
                <#list pageable.items as item>
                    <li class="ds_site-items__item">
                        <#if item.externalLink?? && item.externalLink.url?has_content>
                            <#assign href>${item.externalLink.url}</#assign>
                        <#else>
                            <#assign href><@hst.link hippobean=item /></#assign>
                        </#if>

                        <a href="${href}">${item.title}</a>
                    </li>
                </#list>
            </ul>

            <div class="ds_site-footer__copyright">
                <a class="ds_site-footer__copyright-logo" href="http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/">
                    <img src="<@hst.link path='assets/images/logos/ogl.svg' />" alt="Open Government License" />
                </a>
                <p>All content is available under the <a href="http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/">Open Government Licence v3.0</a>, except for graphic assets and where otherwise stated</p>
                <p>&copy; Crown Copyright</p>
            </div>

            <div class="ds_site-footer__org">
                <img class="ds_site-footer__org-logo" src="<@hst.link path='/assets/images/logos/scottish-government--min--reversed.svg' />" alt="gov.scot" />
            </div>
        </div>
    </div>
</footer>
