<#include "security.ftl">
<#import "pager.ftl" as p>

<div class="container">
    <@p.pager url page />
    <div class="card-columns" id="message-list">
        <#list page.content as message>
            <div class="card my-3" data-id="${message.id}">
                <#if message.filename??>
                    <img src="/img/${message.filename}" style="height: 280px; width: 100%" class="card-img-top"/>
                </#if>
                <div class="m-2">
                    <span>${message.text}</span>
                    <br/>
                    <i>#${message.tag}</i>
                </div>
                <div class="card-footer text-muted container">
                    <div class="row">
                        <a class="col align-self-center d-flex justify-content-start"
                           href="/user-messages/${message.author.id}">${message.authorName}</a>
                        <a class="col align-self-center d-flex justify-content-center" href="#">
                            <#if !true <#--message.meLiked-->>
                                <i class="fas fa-heart"></i>
                            <#else>
                                <i class="far fa-heart"></i>
                            </#if>
                            <#--${message.likes}-->
                        </a>
                        <#if message.author.id == currentUserId>
                            <a class="col align-self-center d-flex justify-content-end"
                               href="/user-messages/${message.author.id}?message=${message.id}">
                                <i class="far fa-edit"></i>
                            </a>
                        </#if>
                    </div>
                </div>
            </div>
        <#else>
            No message
        </#list>
    </div>
    <@p.pager url page />
</div>
