<#import "parts/common.ftl" as c>
<@c.page>
    <div class="form-group col-xl-4 col-md-6">
        <h5>${username}</h5>
        <form method="post">
            <div class="form-group">
                <label class="col-form-label">Password:</label>

                <input type="password" name="password" class="form-control" placeholder="Password"/>
            </div>
            <div class="form-group">
                <label class="col-form-label">Email:</label>
                <input type="email" name="email" class="form-control" placeholder="Email" value="${email!''}"/>
            </div>
            <div class="form-group">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <button class="btn btn-primary" type="submit">
                    Save
                </button>
            </div>
        </form>
    </div>
</@c.page>