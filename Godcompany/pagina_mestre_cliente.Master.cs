using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Godcompany
{
    public partial class pagina_mestre_cliente : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            definicoes_login.Text = Session["nome_utilizador"].ToString();
        }

        protected void LinkButton12_Click(object sender, EventArgs e)
        {
            Response.Redirect("home.aspx", false);
        }
    }
}