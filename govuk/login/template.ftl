<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true>
    <!DOCTYPE html>
    <#-- Attempt to reverse-engineer code for page’s current language, as Keycloak does not currently make this available -->
        <#assign LANG_CODE="en">
            <#if .locale??>
                <#assign LANG_CODE=.locale>
            </#if>
            <#if locale??>
                <#list locale.supported>
                    <#items as supportedLocale>
                        <#if supportedLocale.label==locale.current>
                            <#if supportedLocale.url?contains("?kc_locale=")>
                    <#assign LANG_CODE = supportedLocale.url?keep_after(" ?kc_locale=")[0..1]
>
                </#if>
                <#if supportedLocale.url?contains(" &kc_locale=")>
                    <#assign LANG_CODE = supportedLocale.url?keep_after(" &kc_locale=")[0..1]
>
                </#if>
            </#if>
        </#items>
    </#list>
</#if>
<!--[if lt IE 9]
><html class=" lte-ie8 ${properties.kcHtmlClass!}" lang="${LANG_CODE}">
                                <![endif]
-->
<!--[if gt IE 8]
><!--><html class="${properties.kcHtmlClass!}" lang="${LANG_CODE}"><!--<![endif]
-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title><#nested "title"> - ${realm.displayName!'GOV.UK'}
</title>
    <#-- Start GOV.UK Template <head> content -->
    <!--[if gt IE 8]
><!--><link href="${url.resourcesPath}/vendor/govuk_template/stylesheets/govuk-template.css?0.22.1" media="screen" rel="stylesheet" /><!--<![endif]
-->
    <!--[if IE 6]
><link href="${url.resourcesPath}/vendor/govuk_template/stylesheets/govuk-template-ie6.css?0.22.1" media="screen" rel="stylesheet" /><![endif]
-->
    <!--[if IE 7]
><link href="${url.resourcesPath}/vendor/govuk_template/stylesheets/govuk-template-ie7.css?0.22.1" media="screen" rel="stylesheet" /><![endif]
-->
    <!--[if IE 8]
><link href="${url.resourcesPath}/vendor/govuk_template/stylesheets/govuk-template-ie8.css?0.22.1" media="screen" rel="stylesheet" /><![endif]
-->
    <link href="${url.resourcesPath}/vendor/govuk_template/stylesheets/govuk-template-print.css?0.22.1" media="print" rel="stylesheet" />
    <!--[if IE 8]
><link href="${url.resourcesPath}/vendor/govuk_template/stylesheets/fonts-ie8.css?0.22.1" media="all" rel="stylesheet" /><![endif]
-->
    <!--[if gte IE 9]
><!--><link href="${url.resourcesPath}/vendor/govuk_template/stylesheets/fonts.css?0.22.1" media="all" rel="stylesheet" /><!--<![endif]
-->
    <!--[if lt IE 9]
><script src="${url.resourcesPath}/vendor/govuk_template/javascripts/ie.js?0.22.1"></script><![endif]
-->
    <link rel="shortcut icon" href="${url.resourcesPath}/vendor/govuk_template/images/favicon.ico?0.22.1" type="image/x-icon" />
    <link rel="mask-icon" href="${url.resourcesPath}/vendor/govuk_template/images/gov.uk_logotype_crown.svg?0.22.1" color="#0b0c0c">
    <link rel="apple-touch-icon-precomposed" sizes="152x152" href="${url.resourcesPath}/vendor/govuk_template/images/apple-touch-icon-152x152.png?0.22.1">
    <link rel="apple-touch-icon-precomposed" sizes="120x120" href="${url.resourcesPath}/vendor/govuk_template/images/apple-touch-icon-120x120.png?0.22.1">
    <link rel="apple-touch-icon-precomposed" sizes="76x76" href="${url.resourcesPath}/vendor/govuk_template/images/apple-touch-icon-76x76.png?0.22.1">
    <link rel="apple-touch-icon-precomposed" href="${url.resourcesPath}/vendor/govuk_template/images/apple-touch-icon-60x60.png?0.22.1">
    <#--  import font  Montserrat  -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,400;0,500;0,600;0,700;0,800;0,900;1,400&display=swap" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta property="og:image" content="${url.resourcesPath}/vendor/govuk_template/images/opengraph-image.png?0.22.1">
    <#-- End GOV.UK Template <head> content -->
    <#-- GOV.UK Elements stylesheets -->
    <!--[if gt IE 8]
><!--><link href="${url.resourcesPath}/css/govuk_elements.css" rel="stylesheet" type="text/css"><!--<![endif]
-->
    <!--[if IE 6]
><link href="${url.resourcesPath}/css/govuk_elements-ie6.css" rel="stylesheet" type="text/css" /><![endif]
-->
    <!--[if IE 7]
><link href="${url.resourcesPath}/css/govuk_elements-ie7.css" rel="stylesheet" type="text/css" /><![endif]
-->
    <!--[if IE 8]
><link href="${url.resourcesPath}/css/govuk_elements-ie8.css" rel="stylesheet" type="text/css" /><![endif]
-->
    <#-- End GOV.UK Elements stylesheets -->
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <style>
        .kc-form__page {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 90vh;
        }
        .kc-form__page * {
            font-family: "Montserrat", sans-serif;
            font-size: 1rem;
        }
        .kc-form__page .kc-form__container {
            display: flex;
            flex-direction: column;
            align-items: stretch;
            width: 450px;
        }
        .kc-form__page .kc-form__heading {
            color: #5345b2;
            font-size: 1.5rem;
            text-align: center;
        }
        .kc-form__page .kc-form__group {
            display: flex;
            flex-direction: column;
            margin: 1rem 0;
        }
        .kc-form__page .kc-form__group.kc-form__horizontal {
            flex-direction: row;
            align-items: center;
        }
        .kc-form__page .kc-form__group-wrap {
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: space-between;
            margin-top: -1.2rem;
        }
        .kc-form__page .kc-form__label {
            font-weight: 600;
            margin: 0.3rem 0;
        }
        .kc-form__page .kc-form__input {
            padding: 0.8rem 1.2rem;
            border-radius: 6px;
            outline: none;
            border: 1px solid #a1a1a1;
        }
        .kc-form__page .kc-form__btn {
            padding: 0.8rem 1.2rem;
            border: none;
            background-color: #5345b2;
            color: white;
            border-radius: 6px;
            flex: 1;
            cursor: pointer;
        }
        .kc-form__page .kc-form__group-footer {
            display: flex;
            justify-content: center;
        }
    </style>
</head>
<body class="${properties.kcBodyClass!}"> 
    <script>document.body.className = ((document.body.className) ? document.body.className + ' js-enabled' : 'js-enabled');</script>
    <main id="content" role="main">
                        <div class="kc-form__page">
        <div><#nested "back"></div>
        <div class="grid-row">
            <div class="column-two-thirds">
                <h1 class="heading-large kc-form__heading"><#nested "title"></h1>
                <div id="kc-container" class="${properties.kcContainerClass!}">
                    <div id="kc-container-wrapper" class="${properties.kcContainerWrapperClass!}">
                        <#if realm.internationalizationEnabled>
                            <div id="kc-locale" class="${properties.kcLocaleClass!}">
                                <div id="kc-locale-wrapper" class="${properties.kcLocaleWrapperClass!}">
                                    <div class="kc-dropdown" id="kc-locale-dropdown">
                                        <a href="#" id="kc-current-locale-link">
                                            ${locale.current}
                                        </a>
                                        <ul>
                                            <#list locale.supported as l>
                                                <li class="kc-dropdown-item">
                                                    <a href="${l.url}">
                                                    ${l.label}
                                                    </a>
                                                </li>
                                            </#list>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </#if>
                        <div id="kc-content" class="${properties.kcContentClass!}">
                            <div id="kc-content-wrapper" class="${properties.kcContentWrapperClass!}">
                            ${message}
                                <#if displayMessage && message?has_content>
                                    <#if message.type = 'error'>
                                        <div class="error-summary" role="group" aria-labelledby="error-summary-heading-example-1" tabindex="-1">
                                            <h1 class="heading-medium error-summary-heading" id="error-summary-heading-example-1">
                                                There is a problem with this form
                                            </h1>
                                            <ul class="error-summary-list" id="error-details">
                                                <li>  ${message.summary}  </li>
                                            </ul>
                                        </div>
                                    <#else>
                                        <div class="${properties.kcFeedbackAreaClass!}">
                                            <div class="alert alert-${message.type}"><p>
                                                <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                                                <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                                                <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                                                <span class="kc-feedback-text">  ${message.summary}  </span></p>
                                            </div>
                                        </div>
                                    </#if>
                                </#if>
                                <div id="kc-form" class="${properties.kcFormAreaClass!}">
                                    <div id="kc-form-wrapper" class="${properties.kcFormAreaWrapperClass!}">
                                        <#nested "form">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="column-one-third">
                <#if displayInfo>
                    <div id="kc-info" class="${properties.kcInfoAreaClass!}">
                        <div id="kc-info-wrapper" class="${properties.kcInfoAreaWrapperClass!}">
                            <#nested "info">
                        </div>
                    </div>
                </#if>
            </div>
        </div>
        </div>
    </main>
    <#-- Start GOV.UK Template footer -->
<#--  
    <footer class="group js-footer" id="footer" role="contentinfo">
      <div class="footer-wrapper">
        <div class="footer-meta">
          <div class="footer-meta-inner">
            <div class="open-government-licence">
              <p class="logo"><a href="https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/" rel="license">Open Government Licence</a></p>
                <p>All content is available under the <a href="https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/" rel="license">Open Government Licence v3.0</a>, except where otherwise stated</p>
            </div>
          </div>
          <div class="copyright">
            <a href="http://www.nationalarchives.gov.uk/information-management/re-using-public-sector-information/copyright-and-re-use/crown-copyright/">&copy; Crown copyright</a>
          </div>
        </div>
      </div>
    </footer>
    <div id="global-app-error" class="app-error hidden"></div>
    <script src="${url.resourcesPath}/vendor/govuk_template/javascripts/govuk-template.js?0.22.1"></script>
    <script>if (typeof window.GOVUK === 'undefined') document.body.className = document.body.className.replace('js-enabled', '');</script>  -->
    <#-- End GOV.UK Template footer -->
</body>
</html>
</#macro>