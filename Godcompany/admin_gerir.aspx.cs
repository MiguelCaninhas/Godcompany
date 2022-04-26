using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Godcompany
{
    public partial class admin_gerir : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                utilizador.Text = Session["nome_utilizador"].ToString();

            }

            catch
            {
                Response.Redirect("home.aspx", false);
            }

           
        }
    }
}