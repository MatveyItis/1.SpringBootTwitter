<#import "parts/common.ftl" as c>

<@c.page>
<div class="form-group col-xl-4 col-md-6">
    <h3>User editor</h3>
    <form action="/user" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <div class="form-group">
            <input type="text" class="form-control" value="${user.username}" name="username">
        </div>
        <#list roles as role>
            <label>
                <input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}
            </label>
        </#list>
        <input type="hidden" value="${user.id}" name="userId">
        <div class="form-group">
            <button type="submit" class="btn btn-primary">Save</button>
        </div>
    </form>
</div>
</@c.page>