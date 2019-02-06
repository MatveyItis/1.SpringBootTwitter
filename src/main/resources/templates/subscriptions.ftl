<#import "parts/common.ftl" as c>

<@c.page>
<div class="col-md-6">
    <h3>${userChannel.username}</h3>
    <ul class="list-group">
        <#list users as user>
            <li class="list-group-item">
                <a href="/user-messages/${user.id}">${user.getUsername()}</a>
            </li>
        </#list>
    </ul>
</div>
</@c.page>