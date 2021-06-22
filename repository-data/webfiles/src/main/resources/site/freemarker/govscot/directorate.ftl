<#include "../include/imports.ftl">

<#if document??>
    <@hst.manageContent hippobean=document/>
    <div class="ds_wrapper">
        <main id="main-content" class="ds_layout  ds_layout--article">
            <div class="ds_layout__header">
                <header class="ds_page-header">
                    <h1 class="ds_page-header__title">${document.title}</h1>
                </header>
            </div>

            <div class="ds_layout__content">
                <@hst.html hippohtml=document.content/>

                <h2>Who we are</h2>

                <h3>Cabinet Secretary and Ministers</h3>

                <div>
                    <ul class="person-grid">
                        <#if document.orgRole??>
                            <#list document.orgRole as role>
                                <#assign person = role.incumbent />
                                <@hst.link var="link" hippobean=role/>

                                <li class="person-grid__item">
                                    <div class=person>
                                        <a class="person__link" href="${link}">
                                            <div class="person__image-container">
                                                <div class="person__image-container">
                                                    <#if person.image??>
                                                    <img alt="${person.title}" class="person__image"
                                                    src="<@hst.link hippobean=person.image.xlarge/>"
                                                    srcset="<@hst.link hippobean=person.image.small/> 130w,
                                                        <@hst.link hippobean=person.image.smalldoubled/> 260w,
                                                        <@hst.link hippobean=person.image.medium/> 220w,
                                                        <@hst.link hippobean=person.image.mediumdoubled/> 440w,
                                                        <@hst.link hippobean=person.image.large/> 213w,
                                                        <@hst.link hippobean=person.image.largedoubled/> 426w,
                                                        <@hst.link hippobean=person.image.xlarge/> 263w,
                                                        <@hst.link hippobean=person.image.xlargedoubled/> 526w"
                                                    sizes="(min-width:1200px) 263px, (min-width:920px) 213px, (min-width:768px) 220px, 130px">
                                                    <#else>
                                                    <img class="person__image" src="<@hst.link path='/assets/images/people/placeholder.png'/>" alt="${role.title}">
                                                    </#if>
                                                </div>
                                            </div>
                                        </a>

                                        <div class="person__text-container">
                                            <h4 class="person__name person__name--link">${role.title}</h4>

                                            <p class="person__roles">
                                                <#-- todo: allow for multiple here -->
                                                <#if role.incumbent??>
                                                    <a class="person__role-link" href="${link}">${role.title}</a>
                                                <#else>
                                                    ${role.roleTitle}
                                                </#if>
                                            </p>
                                        </div>
                                    </div>
                                </li>
                            </#list>
                        </#if>
                    </ul>
                </div>

                <h3>Management</h3>

                <div>

                    <ul class="person-grid">
                        <#if document.secondaryOrgRole??>
                            <#list document.secondaryOrgRole as role>
                                <#assign person = role.incumbent />
                                <@hst.link var="link" hippobean=role/>

                                <li class="person-grid__item">
                                    <div class=person>
                                        <a class="person__link" href="${link}">
                                            <div class="person__image-container">
                                                <div class="person__image-container">

                                                    <#if role.incumbent??>
                                                        <#assign person = role.incumbent/>
                                                    <#else>
                                                        <#assign person = role/>
                                                    </#if>

                                                    <#if person.image??>
                                                    <img alt="${person.title}" class="person__image"
                                                    src="<@hst.link hippobean=person.image.xlarge/>"
                                                    srcset="<@hst.link hippobean=person.image.small/> 130w,
                                                        <@hst.link hippobean=person.image.smalldoubled/> 260w,
                                                        <@hst.link hippobean=person.image.medium/> 220w,
                                                        <@hst.link hippobean=person.image.mediumdoubled/> 440w,
                                                        <@hst.link hippobean=person.image.large/> 213w,
                                                        <@hst.link hippobean=person.image.largedoubled/> 426w,
                                                        <@hst.link hippobean=person.image.xlarge/> 263w,
                                                        <@hst.link hippobean=person.image.xlargedoubled/> 526w"
                                                    sizes="(min-width:1200px) 263px, (min-width:920px) 213px, (min-width:768px) 220px, 130px">
                                                    <#else>
                                                    <img class="person__image" src="<@hst.link path='/assets/images/people/placeholder.png'/>" alt="${role.title}">
                                                    </#if>
                                                </div>
                                            </div>
                                        </a>

                                        <div class="person__text-container">
                                            <h4 class="person__name person__name--link">${role.title}</h4>

                                            <p class="person__roles">
                                                <#-- todo: allow for multiple here -->
                                                <#if role.incumbent??>
                                                    <a class="person__role-link" href="${link}">${role.title}</a>
                                                <#else>
                                                    ${role.roleTitle}
                                                </#if>
                                            </p>
                                        </div>
                                    </div>
                                </li>
                            </#list>
                        </#if>
                    </ul>
                </div>

                <#if document.updateHistory?has_content>
                    <div class="update-history">
                        <#include 'common/update-history.ftl'/>
                    </div>
                </#if>
            </div>

            <div class="ds_layout__sidebar">
                <#if document.contactInformation.twitter?has_content
                    ||   document.contactInformation.flickr?has_content
                    ||   document.contactInformation.website?has_content
                    ||   document.contactInformation.email?has_content
                    ||   document.contactInformation.facebook?has_content
                    ||   document.contactInformation.youtube?has_content
                    ||   document.contactInformation.blog?has_content
                    ||   document.contactInformation.postalAddress.content?has_content>
                        <#assign contactInformation = document.contactInformation/>
                    <section>
                        <#include 'common/contact-information.ftl' />
                    </section>
                </#if>

                <#if document.relatedNews?has_content>
                    <section>
                        <h3>News</h3>
                        <ul class="ds_no-bullets">
                            <#list document.relatedNews as newsItem>
                                <li>
                                    <@hst.link var="link" hippobean=newsItem/>
                                    <a href="${link}">${newsItem.title}</a>
                                </li>
                            </#list>
                        </ul>
                    </section>
                </#if>

                <#if document.relatedPublications?has_content>
                    <section>
                        <h3>Publications</h3>
                        <ul class="ds_no-bullets">
                            <#list document.relatedPublications as publication>
                                <li>
                                    <@hst.link var="link" hippobean=publication/>
                                    <a href="${link}">${publication.title}</a>
                                </li>
                            </#list>
                        </ul>
                    </section>
                </#if>

                <#if policies?has_content>
                    <section>
                        <h3>Policies</h3>
                        <ul class="ds_no-bullets">
                            <#list policies as policy>
                                <li>
                                    <@hst.link var="link" hippobean=policy/>
                                    <a data-gtm="policies-${policy?index + 1}"  href="${link}">${policy.title}</a>
                                </li>
                            </#list>
                        </ul>
                    </section>
                </#if>
            </div>

            <div class="ds_layout__feedback">
                <#include '../common/feedback-wrapper.ftl'>
            </div>
        </main>
    </div>

<#-- @ftlvariable name="editMode" type="java.lang.Boolean"-->
<#elseif editMode>
<div>
    <img src="<@hst.link path="/images/essentials/catalog-component-icons/simple-content.png" />"> Click to edit Content
</div>
</#if>

<#if document??>
    <@hst.headContribution category="pageTitle">
        <title>${document.title?html} - gov.scot</title>
    </@hst.headContribution>
    <@hst.headContribution>
        <meta name="description" content="${document.metaDescription?html}"/>
    </@hst.headContribution>

    <@hst.link var="canonicalitem" hippobean=document canonical=true/>
    <#include "common/canonical.ftl" />

    <#include "common/gtm-datalayer.ftl"/>
</#if>
