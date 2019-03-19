<#include "security.ftl">

<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group">
            <label class="col-sm-6 col-form-label">User Name:</label>
            <div class="col-md-6 col-xl-4">
                <input type="text" name="username" value="<#if user??>${user.username}</#if>"
                       class="form-control ${(usernameError??)?string('is-invalid', '')}"
                       placeholder="User name"/>
                <#if usernameError??>
                    <div class="invalid-feedback">
                        ${usernameError}
                    </div>
                </#if>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-6 col-form-label">Password:</label>
            <div class="col-md-6 col-xl-4">
                <input type="password" name="password"
                       class="form-control ${(passwordError??)?string('is-invalid', '')}" placeholder="Password"/>
                <#if passwordError??>
                    <div class="invalid-feedback">
                        ${passwordError}
                    </div>
                </#if>
            </div>
        </div>
        <#if isRegisterForm>
            <div class="form-group">
                <label class="col-sm-6 col-form-label">Password:</label>
                <div class="col-md-6 col-xl-4">
                    <input type="password" name="password2"
                           class="form-control ${(password2Error??)?string('is-invalid', '')}"
                           placeholder="Repeat password"
                    />
                    <#if password2Error??>
                        <div class="invalid-feedback">
                            ${password2Error}
                        </div>
                    </#if>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-6 col-form-label">Email:</label>
                <div class="col-md-6 col-xl-4">
                    <input type="email" name="email" value="<#if user??>${user.email}</#if>"
                           class="form-control ${(emailError??)?string('is-invalid', '')}"
                           placeholder="Email"/>
                    <#if emailError??>
                        <div class="invalid-feedback">
                            ${emailError}
                        </div>
                    </#if>
                </div>
            </div>
        </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <#if isRegisterForm>
            <div class="dorm-group mb-2">
                <div class="col-md-6">
                    <div class="g-recaptcha" data-sitekey="6LexQI8UAAAAAIB5qQQaF3jbLQA-UyMdh3R8vRPU"></div>
                    <#if captchaError??>
                        <div class="col-md-6 col-xl-4 alert alert-${messageType}" role="alert">
                            ${captchaError}
                        </div>
                    </#if>
                </div>
            </div>
        </#if>
        <div class="form-group">
            <div class="col-md-6 col-xl-4">
                <button class="btn btn-primary" type="submit">
                    <#if isRegisterForm>
                        Create
                    <#else>
                        Sign In
                    </#if>
                </button>
                <#if !isRegisterForm>
                    <a href="/registration">Registration</a>
                </#if>
            </div>
        </div>
    </form>
</#macro>

<#macro logout>
    <form class="form-inline my-2 my-lg-0" action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button class="btn btn-dark btn-xs" type="submit"><#if user??>Sign Out<#else>Log in</#if></button>
    </form>
</#macro>