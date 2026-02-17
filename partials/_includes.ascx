<script runat="server">
  protected override void OnPreRender(EventArgs e) {
    base.OnPreRender(e);
    // Remove the default dnn files if the user is not logged in and not on a login related page
    var pageObj = Context.CurrentHandler as Page;
    var userInfo = UserController.GetCurrentUserInfo();
    if (
      userInfo.UserID == -1
      && !pageObj.Request.Url.Query.Contains("ctl=Login")
      && !pageObj.Request.Url.Query.Contains("ctl=SendPassword")
      && !pageObj.Request.Url.Query.Contains("ctl=PasswordReset")
    ) {
      var loader = this.Page.FindControl("ClientResourceIncludes");
      if (loader != null) {
        ClientDependency.Core.Controls.ClientDependencyInclude ctlToRemove = null;
        foreach(ClientDependency.Core.Controls.ClientDependencyInclude ctl in loader.Controls) {
          if (ctl.Name.ToLowerInvariant() == "dnndefault" && ctl.DependencyType == ClientDependency.Core.ClientDependencyType.Css) {
            ctlToRemove = ctl;
            break;
          }
        }
        if (ctlToRemove != null) {
          loader.Controls.Remove(ctlToRemove);
        }
      }
    }
  }
</script>