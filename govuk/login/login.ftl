<#import "template.ftl" as layout>
    <@layout.registrationLayout displayInfo=social.displayInfo; section>
        <#if section="title">
            ${msg("Đăng nhập hệ thống S2B",(realm.displayName!''))}
            <#elseif section="header">
                ${msg("loginTitleHtml",(realm.displayNameHtml!''))?no_esc}
                <#elseif section="form">
                    <#if realm.password>
                        <div class="kc-form__container">
                            <form id="kc-form-login" class="${properties.kcFormClass!} kc-form__wrap" action="${url.loginAction}" method="post">
                                <div class="kc-form__group">
                                    <label for="username" class="kc-form__label ${properties.kcLabelClass!}">
                                        <#if !realm.loginWithEmailAllowed>
                                            Mã sinh viên
                                            <#elseif !realm.registrationEmailAsUsername>
                                                ${msg("usernameOrEmail")}
                                                <#else>
                                                    ${msg("email")}
                                        </#if>
                                    </label>
                                    <#if usernameEditDisabled??>
                                        <input id="username" class="kc-form__input ${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" disabled />
                                        <#else>
                                            <input id="username" class="kc-form__input ${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" />
                                    </#if>
                                </div>
                                <div class="kc-form__group">
                                    <label for="password" class="kc-form__label"> Mật khẩu: </label>
                                    <input
                                        id="password"
                                        name="password"
                                        type="password"
                                        class="kc-form__input"
                                        placeholder="Nhập mật khẩu" />
                                </div>
                                <#-- <div class="kc-form__group-wrap">
                                    <div class="kc-form__group kc-form__horizontal">
                                        <input id="rememberMe" type="checkbox" class="kc-form__input" />
                                        <label for="rememberMe" class="kc-form__label">
                                            Nhớ mật khẩu
                                        </label>
                                    </div>
                                    <div class="kc-form__group">Quên mật khẩu</div>
                        </div> -->
                        <div class="${properties.kcFormOptionsWrapperClass!} ${properties.kcFormGroupClass}">
                            <#if realm.resetPasswordAllowed>
                                <p style="text-align: right; margin-top: 1rem">
                                    <a href="${url.loginResetCredentialsUrl}">
                                        ${msg("doForgotPassword")}
                                    </a>
                                </p>
                            </#if>
                        </div>
                        <#-- <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!} ${properties.kcFormGroupClass} kc-form__btn">
                            <div class="${properties.kcFormButtonsWrapperClass!}"> -->
                                <div class="kc-form__group">
                                    <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!} kc-form__btn" name="login" id="kc-login" type="submit" value="Đăng nhập" />
                                </div>
                                <#-- </div>
                            </div> -->
                            </form>
                            </div>
                    </#if>
                    <#elseif section="info">
                        <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
                            <div class="kc-form__group-footer" style="margin-top: 2rem">
                                <span> Bạn chưa có tài khoản? </span>
                                <a href="${url.registrationUrl}"> Tạo tài khoản mới </a>
                            </div>
                        </#if>
                        <#if realm.password && social.providers??>
                            <div id="kc-social-providers">
                                <h2 class="heading-medium">
                                    ${msg("socialProviders")}
                                </h2>
                                <ul class="list">
                                    <#list social.providers as p>
                                        <li><a href="${p.loginUrl}" id="zocial-${p.alias}" class="button zocial ${p.providerId}">
                                                ${p.displayName}
                                            </a></li>
                                    </#list>
                                </ul>
                            </div>
                        </#if>
        </#if>
    </@layout.registrationLayout>