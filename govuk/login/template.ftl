<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true back=false backToApplication=false>
<!DOCTYPE html >

<#-- Attempt to reverse-engineer code for page’s current language, as Keycloak does not currently make this available -->
<#assign LANG_CODE = "en">
<#if .locale??>
    <#assign LANG_CODE = .locale>
</#if>
<#if locale??>
    <#list locale.supported>
        <#items as supportedLocale>
            <#if supportedLocale.label == locale.current>
                <#if supportedLocale.url?contains("?kc_locale=")>
                    <#assign LANG_CODE = supportedLocale.url?keep_after("?kc_locale=")[0..1]>
                </#if>
                <#if supportedLocale.url?contains("&kc_locale=")>
                    <#assign LANG_CODE = supportedLocale.url?keep_after("&kc_locale=")[0..1]>
                </#if>
            </#if>
        </#items>
    </#list>
</#if>

<html class="govuk-template" lang="${LANG_CODE}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title><#nested "title"> - ${realm.displayName!'GOV.UK'}</title>

    <#-- Start GOV.UK Template <head> content -->

    <link rel="shortcut icon" href="${url.resourcesPath}/assets/images/favicon.ico" type="image/x-icon" />
    <link rel="mask-icon" href="${url.resourcesPath}/assets/images/govuk-logotype-crown.png" color="#0b0c0c">
    <link rel="apple-touch-icon-precomposed" sizes="152x152" href="${url.resourcesPath}/assets/images/govuk-apple-touch-icon-152x152.png">
    <link rel="apple-touch-icon-precomposed" sizes="167x167" href="${url.resourcesPath}/assets/images/govuk-apple-touch-icon-167x167.png">
    <link rel="apple-touch-icon-precomposed" sizes="180x180" href="${url.resourcesPath}/assets/images/govuk-apple-touch-icon-180x180.png">
    <link rel="apple-touch-icon-precomposed" href="${url.resourcesPath}/assets/images/govuk-apple-touch-icon.png">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta property="og:image" content="${url.resourcesPath}/assets/images/govuk-opengraph-image.png">

    <#-- End GOV.UK Template <head> content -->

    <#-- GOV.UK Design System stylesheet -->

    <!--[if !IE 8]><!--><link href="${url.resourcesPath}/css/application.css" rel="stylesheet" type="text/css"><!--<![endif]-->
    <!--[if IE 8]><link href="${url.resourcesPath}/css/application-ie8.css" rel="stylesheet" type="text/css"><![endif]-->

    <#-- End GOV.UK Design System stylesheet -->
    <#nested "scripts">
</head>

<body class="govuk-template__body">
    <#-- Add GOV.UK Template <body> JavaScript class -->
    <script>document.body.className = ((document.body.className) ? document.body.className + ' js-enabled' : 'js-enabled');</script>

    <#-- Start GOV.UK Template header -->

    <a href="#content" class="govuk-skip-link">Skip to main content</a>
    <header class="govuk-header" role="banner" data-module="header">
        <div class="govuk-header__container govuk-width-container">
            <div class="govuk-header__logo">
            <a href="#" class="govuk-header__link govuk-header__link--homepage">
                <span class="govuk-header__logotype">

                <svg role="presentation" focusable="false" class="govuk-header__logotype-crown" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 132 97" height="32" width="36">
                    <path fill="currentColor" fill-rule="evenodd" d="M25 30.2c3.5 1.5 7.7-.2 9.1-3.7 1.5-3.6-.2-7.8-3.9-9.2-3.6-1.4-7.6.3-9.1 3.9-1.4 3.5.3 7.5 3.9 9zM9 39.5c3.6 1.5 7.8-.2 9.2-3.7 1.5-3.6-.2-7.8-3.9-9.1-3.6-1.5-7.6.2-9.1 3.8-1.4 3.5.3 7.5 3.8 9zM4.4 57.2c3.5 1.5 7.7-.2 9.1-3.8 1.5-3.6-.2-7.7-3.9-9.1-3.5-1.5-7.6.3-9.1 3.8-1.4 3.5.3 7.6 3.9 9.1zm38.3-21.4c3.5 1.5 7.7-.2 9.1-3.8 1.5-3.6-.2-7.7-3.9-9.1-3.6-1.5-7.6.3-9.1 3.8-1.3 3.6.4 7.7 3.9 9.1zm64.4-5.6c-3.6 1.5-7.8-.2-9.1-3.7-1.5-3.6.2-7.8 3.8-9.2 3.6-1.4 7.7.3 9.2 3.9 1.3 3.5-.4 7.5-3.9 9zm15.9 9.3c-3.6 1.5-7.7-.2-9.1-3.7-1.5-3.6.2-7.8 3.7-9.1 3.6-1.5 7.7.2 9.2 3.8 1.5 3.5-.3 7.5-3.8 9zm4.7 17.7c-3.6 1.5-7.8-.2-9.2-3.8-1.5-3.6.2-7.7 3.9-9.1 3.6-1.5 7.7.3 9.2 3.8 1.3 3.5-.4 7.6-3.9 9.1zM89.3 35.8c-3.6 1.5-7.8-.2-9.2-3.8-1.4-3.6.2-7.7 3.9-9.1 3.6-1.5 7.7.3 9.2 3.8 1.4 3.6-.3 7.7-3.9 9.1zM69.7 17.7l8.9 4.7V9.3l-8.9 2.8c-.2-.3-.5-.6-.9-.9L72.4 0H59.6l3.5 11.2c-.3.3-.6.5-.9.9l-8.8-2.8v13.1l8.8-4.7c.3.3.6.7.9.9l-5 15.4v.1c-.2.8-.4 1.6-.4 2.4 0 4.1 3.1 7.5 7 8.1h.2c.3 0 .7.1 1 .1.4 0 .7 0 1-.1h.2c4-.6 7.1-4.1 7.1-8.1 0-.8-.1-1.7-.4-2.4V34l-5.1-15.4c.4-.2.7-.6 1-.9zM66 92.8c16.9 0 32.8 1.1 47.1 3.2 4-16.9 8.9-26.7 14-33.5l-9.6-3.4c1 4.9 1.1 7.2 0 10.2-1.5-1.4-3-4.3-4.2-8.7L108.6 76c2.8-2 5-3.2 7.5-3.3-4.4 9.4-10 11.9-13.6 11.2-4.3-.8-6.3-4.6-5.6-7.9 1-4.7 5.7-5.9 8-.5 4.3-8.7-3-11.4-7.6-8.8 7.1-7.2 7.9-13.5 2.1-21.1-8 6.1-8.1 12.3-4.5 20.8-4.7-5.4-12.1-2.5-9.5 6.2 3.4-5.2 7.9-2 7.2 3.1-.6 4.3-6.4 7.8-13.5 7.2-10.3-.9-10.9-8-11.2-13.8 2.5-.5 7.1 1.8 11 7.3L80.2 60c-4.1 4.4-8 5.3-12.3 5.4 1.4-4.4 8-11.6 8-11.6H55.5s6.4 7.2 7.9 11.6c-4.2-.1-8-1-12.3-5.4l1.4 16.4c3.9-5.5 8.5-7.7 10.9-7.3-.3 5.8-.9 12.8-11.1 13.8-7.2.6-12.9-2.9-13.5-7.2-.7-5 3.8-8.3 7.1-3.1 2.7-8.7-4.6-11.6-9.4-6.2 3.7-8.5 3.6-14.7-4.6-20.8-5.8 7.6-5 13.9 2.2 21.1-4.7-2.6-11.9.1-7.7 8.8 2.3-5.5 7.1-4.2 8.1.5.7 3.3-1.3 7.1-5.7 7.9-3.5.7-9-1.8-13.5-11.2 2.5.1 4.7 1.3 7.5 3.3l-4.7-15.4c-1.2 4.4-2.7 7.2-4.3 8.7-1.1-3-.9-5.3 0-10.2l-9.5 3.4c5 6.9 9.9 16.7 14 33.5 14.8-2.1 30.8-3.2 47.7-3.2z"></path>

                    <image src="/assets/images/govuk-logotype-crown.png" class="govuk-header__logotype-crown-fallback-image"></image>
                </svg>
                <span class="govuk-header__logotype-text">
                    GOV.UK
                </span>
                </span>
            </a>
            </div>
            <#if realm.displayNameHtml?? || realm.displayName??>
                <div class="govuk-header__content">
                    <#if realm.displayNameHtml?? && realm.displayNameHtml != realm.displayName>
                        <#--  ${realm.displayNameHtml?no_esc}  -->
                    <#elseif realm.displayName??>
                        <a href="#" class="govuk-header__link govuk-header__link--service-name">${realm.displayName}</a>
                    </#if>
                </div>
            </#if>
        </div>
    </header>

    <div id="global-header-bar"></div>

    <#-- End GOV.UK Template header -->
    <div class="govuk-width-container">
        <#if back>
            <a href="${url.loginRestartFlowUrl}" class="govuk-back-link">${msg("backToLogin")}</a>
        <#elseif backToApplication>
            <#if client?? && client.baseUrl?has_content>
                <a href="${client.baseUrl}" class="govuk-back-link">${msg("backToLogin")}</a>
            <#else>
                <a href="${url.loginRestartFlowUrl}" class="govuk-back-link">${msg("backToLogin")}</a>
            </#if>
        </#if>
        <main role="main" class="govuk-main-wrapper" id="main-content">
            <#-- Sometimes keycloak puts messsages on the view model that we are not interested
                                    in showing. Changing this behaviour would require overrding core parts in java -
                                    instead we set them to the empty string. See `messages_en.properties` -->
            <#if displayMessage && message?has_content && message.summary != "">
                <#if message.type = 'error'>
                    <div class="govuk-error-summary" role="alert" aria-labelledby="error-summary-title" tabindex="-1" data-module="error-summary">
                        <h2 class="govuk-error-summary__title" id="error-summary-title">
                            ${msg("validationErrorHeader")}
                        </h2>
                        <div class="govuk-error-summary__body">
                            <ul class="govuk-list govuk-error-summary__list" >
                                <#list message.summary?split("<br>") as messageEntry>
                                    <li>${messageEntry}</li>
                                </#list>
                            </ul>
                        </div>
                    </div>
                <#else>
                <#--Using the following banner style: https://github.com/hmcts/frontend/blob/master/src/components/banner/template.njk -->
                    <div class="hmcts-banner <#if message.type = 'success'>hmcts-banner--success<#elseif message.type = 'warning'>hmcts-banner--warning</#if>">
                        <#if message.type = 'success'>
                            <svg class="hmcts-banner__icon" fill="currentColor" role="presentation" focusable="false" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 25 25" height="25" width="25">
                                <path d="M25,6.2L8.7,23.2L0,14.1l4-4.2l4.7,4.9L21,2L25,6.2z" />
                            </svg>
                        </#if>
                        <#if message.type = 'warning'>
                            <svg class="hmcts-banner__icon" fill="currentColor" role="presentation" focusable="false" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 25 25" height="25" width="25">
                                <path d="M13.6,15.4h-2.3v-4.5h2.3V15.4z M13.6,19.8h-2.3v-2.2h2.3V19.8z M0,23.2h25L12.5,2L0,23.2z" />
                            </svg>
                        </#if>
                        <#if message.type = 'info'>
                            <svg class="hmcts-banner__icon" fill="currentColor" role="presentation" focusable="false" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 25 25" height="25" width="25">
                                <path d="M13.7,18.5h-2.4v-2.4h2.4V18.5z M12.5,13.7c-0.7,0-1.2-0.5-1.2-1.2V7.7c0-0.7,0.5-1.2,1.2-1.2s1.2,0.5,1.2,1.2v4.8
C13.7,13.2,13.2,13.7,12.5,13.7z M12.5,0.5c-6.6,0-12,5.4-12,12s5.4,12,12,12s12-5.4,12-12S19.1,0.5,12.5,0.5z" />
                            </svg>
                        </#if>
                        <div class="hmcts-banner__message">
                            <span class="hmcts-banner__assistive">
                                <#if message.type = 'success'>Success: </#if>
                                <#if message.type = 'warning'>Warning: </#if>
                                <#if message.type = 'info'></#if>
                            </span>
                            ${message.summary?no_esc}
                        </div>

                    </div>
                </#if>
            </#if>
            <div class="govuk-grid-row">
                <div class="govuk-grid-column-two-thirds">
                    <h1 class="govuk-heading-xl"><#nested "header"></h1>
                    <div id="kc-container" class="${properties.kcContainerClass!}">
                        <div id="kc-container-wrapper" class="${properties.kcContainerWrapperClass!}">
                            <div id="kc-content" class="${properties.kcContentClass!}">
                                <div id="kc-content-wrapper" class="${properties.kcContentWrapperClass!}">
                                    <div id="kc-form" class="${properties.kcFormAreaClass!}">
                                        <div id="kc-form-wrapper" class="${properties.kcFormAreaWrapperClass!} govuk-body">
                                            <#nested "form">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="govuk-grid-column-one-third">
                    <#if displayInfo>
                        <div id="kc-info" class="${properties.kcInfoAreaClass!}">
                            <div id="kc-info-wrapper" class="${properties.kcInfoAreaWrapperClass!}">
                                <#nested "info">
                            </div>
                        </div>
                    </#if>
                </div>
            </div>
        </main>
    </div>


    <#-- Start GOV.UK Template footer -->

    <footer class="govuk-footer " role="contentinfo">
        <div class="govuk-width-container ">
            <div class="govuk-footer__meta">
                <div class="govuk-footer__meta-item">
                    <a class="govuk-footer__link govuk-footer__copyright-logo" href="https://www.nationalarchives.gov.uk/information-management/re-using-public-sector-information/uk-government-licensing-framework/crown-copyright/">© Crown copyright</a>
                </div>
            </div>
        </div>
    </footer>

    <div id="global-app-error" class="app-error hidden"></div>

    <script>if (typeof window.GOVUK === 'undefined') document.body.className = document.body.className.replace('js-enabled', '');</script>

    <#-- End GOV.UK Template footer -->

    <script src="${url.resourcesPath}/all.js"></script>
    <script>window.GOVUKFrontend.initAll()</script>
    </body>

</html>
</#macro>
