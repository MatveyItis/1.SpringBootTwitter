<#import "parts/common.ftl" as c>

<@c.page>
<div class="form-row">
    <div class="form-group col-md-6">
        <form method="get" action="/main" class="form-inline">
            <div class="form-group">
                <input type="text" name="filter" class="form-control" placeholder="Search by tag..."
                       value="${filter?if_exists}"/>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary ml-2">Search</button>
            </div>
        </form>
    </div>
</div>

    <#include "parts/messageEdit.ftl" />

    <#include "parts/messageList.ftl" />
</@c.page>