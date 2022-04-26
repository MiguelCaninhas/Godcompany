using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Godcompany
{
    public partial class Pagina_inicial : System.Web.UI.MasterPage
    {
         
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void login_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx", false);
        }

       
        protected void LinkButton12_Click(object sender, EventArgs e)
        {
            Response.Redirect("home.aspx", false);
        }
    }
}