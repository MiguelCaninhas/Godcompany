using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Windows.Forms;
using System.IO;

namespace Godcompany
{
    public partial class Admin_editar_pack : System.Web.UI.Page
    {
        bool validar_data_partida, validar_data_chegada;
        int linha;
        string id_viagens_pacotes_eliminar, id_voo_eliminar, codigo, id_hoteis_eliminar, id_voos_eliminar, id_atividades_eliminar;

        string configuracao = "server=localhost; userid=root; database=bd_agencia_viagens";


        int hoteis_grid_mostrar_v = 0, voos_grid_mostrar_v = 0, atividades_grid_mostrar_v = 0;
        int[] atividades = new int[1000];
        int[] carregar_atividades = new int[1000];
        int[] hoteis = new int[1000];
        int[] voos = new int[1000];
        int i_atividades;
        int i_hoteis;
        int i_voos;
        int max;

        int[] id_atividades = new int[1000];

        int[] id_hoteis = new int[1000];
        int[] id_voos = new int[1000];

        int contar_voos = 0;

        int max_voo;
        int max_atividades;
        int max_hoteis;
        protected void Page_Load(object sender, EventArgs e)
        {
            i_atividades = 0;
            i_hoteis = 0;
            i_voos = 0;




            if(Session["validar_apagar_correct_editar_pack"] == "true")
            {
                Session["validar_apagar_correct_editar_pack"] = "false";

                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", " Correct_eliminar()", true);

            }

            if(Session["editar_pack_success"] == "true")
            {
                Session["editar_pack_success"] = "false";
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", " Correct()", true);
            }



        }

        protected void editar_Click(object sender, EventArgs e)
        {

            string data_chegada = "", data_entrega  = "";

         if (dia_chegada_escrever.Text == "" && dia_partida_escrever.Text == "") {

                validar_data_chegada = true;
               
          }


         if (validar_data_chegada == true)
            {

                data_chegada = dia_chegada.Text;
                data_entrega = dia_partida.Text;
               
            }



            else
            {
                data_chegada = dia_chegada_escrever.Text;
                data_entrega = dia_partida_escrever.Text;
            }



            executar_atividade();



            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand comando = new MySqlCommand();

            comando.Connection = ligar;

            ligar.Open();


            string filename = Session["foto_pack_editar"].ToString(); ;









           


            if (filename != "")
            {
                FileUpload1.SaveAs(Server.MapPath("images/") + filename);

                comando.CommandText = "update  viagens_pacotes set nome_pacote = @nome_pacote,  id_pais = @id_pais, imagem = @imagem, descricao = @descricao, data_partida = @data_partida, data_chegada = @data_chegada, preço =@preco  where id_viagens_pacotes = @id_viagens_pacotes";



                comando.Parameters.AddWithValue("@id_viagens_pacotes", id_viagens_pacotes.Text);
                comando.Parameters.AddWithValue("@nome_pacote", nome_pacote.Text);
                comando.Parameters.AddWithValue("@id_pais", Drop_pais_pack.SelectedValue);
                comando.Parameters.AddWithValue("@preco", preco.Text);
                comando.Parameters.AddWithValue("@descricao", descricao.Text);
                comando.Parameters.AddWithValue("@data_partida", Convert.ToDateTime(data_entrega));
                comando.Parameters.AddWithValue("@data_chegada", Convert.ToDateTime(data_chegada));
                comando.Parameters.AddWithValue("@imagem", filename.ToString());


                try
                {
                    comando.ExecuteNonQuery();

                    Session["editar_pack_success"] = "true";
                    //Response.Redirect("admim_editar_pack.aspx", false);

                }


                catch
                {

                    MessageBox.Show("erro", " ");
                    //Response.Redirect("admim_editar_pack.aspx", false);


                }

            }

           

            ligar.Close();










            ligar.Open();

            for (int u = 0; u < i_atividades; u++)
            {



                MySqlCommand comando3 = new MySqlCommand();

                comando3.Connection = ligar;


                comando3.CommandText = "insert into viagens_atividades(id_viagens_pacotes, id_atividade) values('" + id_viagens_pacotes.Text + "', '" + atividades[u] + "'  )";



                comando3.ExecuteNonQuery();

               


            }

            ligar.Close();

            ligar.Open();







            MySqlCommand comando42 = new MySqlCommand();

            comando42.Connection = ligar;


            comando42.CommandText = "Delete from viagens_hoteis where id_viagens_pacotes = '" + id_viagens_pacotes.Text + "'";



            comando42.ExecuteNonQuery();





            ligar.Close();



            ligar.Open();





            if (Drop_hotel.SelectedValue != "")
            {

                MySqlCommand comando4 = new MySqlCommand();

                comando4.Connection = ligar;


                comando4.CommandText = "insert into viagens_hoteis(id_viagens_pacotes, id_hoteis) values('" + id_viagens_pacotes.Text + "', '" + Drop_hotel.SelectedValue + "'  )";



                comando4.ExecuteNonQuery();





               
            }



            else
            {

                MessageBox.Show("Não foi editado o hotel com sucesso devido a nao ter selecionado hotel algum", "Atenção");
            }


            ligar.Close();


            if (Drop_voo_destino.SelectedValue != Drop_voo_origem.SelectedValue)
            {
                ligar.Open();





                MySqlCommand comando52 = new MySqlCommand();

                comando52.Connection = ligar;


                comando52.CommandText = "Delete from viagens_voo where  id_viagens_pacotes = '" + id_viagens_pacotes.Text + "'";



                comando52.ExecuteNonQuery();






                ligar.Close();



                ligar.Open();





                MySqlCommand comando5 = new MySqlCommand();

                comando5.Connection = ligar;


                comando5.CommandText = "insert into viagens_voo(id_viagens_pacotes, id_voo) values('" + id_viagens_pacotes.Text + "', '" + Drop_voo_origem.SelectedValue + "'  )";



                comando5.ExecuteNonQuery();


                comando5.CommandText = "insert into viagens_voo(id_viagens_pacotes, id_voo) values('" + id_viagens_pacotes.Text + "', '" + Drop_voo_destino.SelectedValue + "'  )";



                comando5.ExecuteNonQuery();




                ligar.Close();


            }

            else {

                MessageBox.Show("Não foi editado os voos com sucesso devido ser o voo de ida e o voo de volta o mesmo", "Atenção");
            }

            Response.Redirect("admin_editar_pack.aspx", false);
       




                




           


      




        }








        public void executar_atividade()
        {
            string configuracao2 = "server=localhost; userid=root; database=bd_agencia_viagens";
            MySqlConnection ligar2 = new MySqlConnection(configuracao2);
            MySqlCommand comando2 = new MySqlCommand();

            comando2.Connection = ligar2;
            ligar2.Open();


            for (int t = 0; t < Atividade_grid.Rows.Count; t++)
            {
                System.Web.UI.WebControls.CheckBox ChkBoxRows = (System.Web.UI.WebControls.CheckBox)Atividade_grid.Rows[t].Cells[0].FindControl("CheckBox3");

                if (ChkBoxRows.Checked == true)
                {
                    atividades[i_atividades] = Convert.ToInt32(Atividade_grid.Rows[t].Cells[1].Text);



                    i_atividades++;

                }
            }
            ligar2.Close();

        }


       


       

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Editar_comando")
            {

                linha = Convert.ToInt32(e.CommandArgument);
                codigo = GridView1.Rows[linha].Cells[3].Text;

                string id_reserva = "";

                MySqlConnection ligar = new MySqlConnection(configuracao);
                MySqlCommand comando2 = new MySqlCommand();

                MySqlDataReader DR;

                comando2.Connection = ligar;

                ligar.Open();

                comando2.CommandText = "select id_reserva from reservas where id_viagens_pacotes = @id_viagens_pacotes";

                comando2.Parameters.AddWithValue("@id_viagens_pacotes", codigo);



                DR = comando2.ExecuteReader();


                if (DR.Read())
                {
                    id_reserva = DR["id_reserva"].ToString();

                }


                DR.Close();

                ligar.Close();




                if (id_reserva != "")
                {

                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "atecao_editar_comando()", true);

                }

            

                Panel1.Visible = false;

                Panel_tudo.Visible = true;

                mostrar_btn.Visible = true;

               

                Session["codigo"] = codigo;


                MySqlCommand comando = new MySqlCommand();
                MySqlDataReader DR2;

                comando.Connection = ligar;

                ligar.Open();

                comando.CommandText = "Select  id_viagens_pacotes, nome_pacote, preço, id_pais, imagem, descricao, data_partida, data_chegada from viagens_pacotes where " +
                    "(id_viagens_pacotes = @id_viagens_pacotes)";
                comando.Parameters.AddWithValue("@id_viagens_pacotes", codigo);


                DR2 = comando.ExecuteReader();



                if (DR2.Read())
                {
                    nome_pacote.Text = Convert.ToString(DR2["nome_pacote"]);
                    preco.Text = Convert.ToString(DR2["preço"]);
                    descricao.Text = Convert.ToString(DR2["descricao"]);
                    Drop_pais_pack.SelectedValue = Convert.ToString(DR2["id_pais"]);
                    id_viagens_pacotes.Text = Convert.ToString(DR2["id_viagens_pacotes"]);
                    dia_partida.Text = Convert.ToDateTime( DR2["data_partida"]).ToString("d MMMM yyyy");
                    dia_chegada.Text = Convert.ToDateTime(DR2["data_chegada"]).ToString("d MMMM yyyy");

                }







            }


            else if (e.CommandName == "Ver_comando")
            {
                linha = Convert.ToInt32(e.CommandArgument);
                codigo = GridView1.Rows[linha].Cells[3].Text;

                string id_reserva = "";

                MySqlConnection ligar = new MySqlConnection(configuracao);
                MySqlCommand comando2 = new MySqlCommand();

                MySqlDataReader DR;

                comando2.Connection = ligar;

                ligar.Open();

                comando2.CommandText = "select id_reserva from reservas where id_viagens_pacotes = @id_viagens_pacotes";

                comando2.Parameters.AddWithValue("@id_viagens_pacotes", codigo);



                DR = comando2.ExecuteReader();


                if (DR.Read())
                {
                    id_reserva = DR["id_reserva"].ToString();

                }


                DR.Close();

                ligar.Close();




                if (id_reserva != "")
                {

                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "atecao_editar_comando()", true);

                }

                Validar_errado.Visible = false;
                validar_certo.Visible = true;



                Panel_tudo.Visible = false;
                Panel1.Visible = true;

                mostrar_btn.Visible = false;

          

                Session["codigo_ver"] = codigo;

               
                    mostrar_hoteis.SelectCommand = "SELECT viagens_pacotes.nome_pacote, viagens_hoteis.id_hoteis, hoteis.nome_hotel, viagens_hoteis.id_viagens_pacotes FROM viagens_hoteis INNER JOIN hoteis ON viagens_hoteis.id_hoteis = hoteis.id_hoteis INNER JOIN viagens_pacotes ON viagens_hoteis.id_viagens_pacotes = viagens_pacotes.id_viagens_pacotes WHERE viagens_hoteis.id_hoteis = hoteis.id_hoteis AND viagens_hoteis.id_viagens_pacotes = '" + codigo + "'";
                    mostrar_voos.SelectCommand = "SELECT viagens_pacotes.nome_pacote, viagens_voo.id_voo, voo.nome AS nome_voo, viagens_voo.id_viagens_pacotes FROM viagens_voo INNER JOIN voo ON viagens_voo.id_voo = voo.id_voo INNER JOIN viagens_pacotes ON viagens_voo.id_viagens_pacotes = viagens_pacotes.id_viagens_pacotes WHERE viagens_voo.id_voo = voo.id_voo AND viagens_voo.id_viagens_pacotes = '" + codigo + "'";
                    mostrar_atividades.SelectCommand = "SELECT viagens_pacotes.nome_pacote, viagens_atividades.id_atividade, atividade.nome, viagens_atividades.id_viagens_pacotes FROM viagens_atividades INNER JOIN atividade ON viagens_atividades.id_atividade = atividade.id_atividade INNER JOIN viagens_pacotes ON viagens_atividades.id_viagens_pacotes = viagens_pacotes.id_viagens_pacotes WHERE viagens_atividades.id_atividade = atividade.id_atividade AND viagens_atividades.id_viagens_pacotes = '" + codigo + "'";


          





            }



            else if (e.CommandName == "eliminar_comando")
            {



                bool validar_eliminar = false;
                linha = Convert.ToInt32(e.CommandArgument);
                codigo = GridView1.Rows[linha].Cells[3].Text;

                string id_reserva = "";

                MySqlConnection ligar = new MySqlConnection(configuracao);
                MySqlCommand comando2 = new MySqlCommand();

                MySqlDataReader DR;

                comando2.Connection = ligar;

                ligar.Open();

                comando2.CommandText = "select id_reserva from reservas where id_viagens_pacotes = @id_viagens_pacotes";

                comando2.Parameters.AddWithValue("@id_viagens_pacotes", codigo);



               DR =  comando2.ExecuteReader();


                if (DR.Read())
                {
                    id_reserva = DR["id_reserva"].ToString();

                }


                DR.Close();

                ligar.Close();


                if (id_reserva == "")
                {

                    ligar.Open();
                    MySqlCommand comando = new MySqlCommand();
                    comando.Connection = ligar;

                    comando.Parameters.Clear();
                    comando.CommandText = "DELETE from viagens_hoteis where id_viagens_pacotes ='" + codigo +"'";



                     comando.ExecuteNonQuery();




                     comando.Parameters.Clear();

                     comando.CommandText = "DELETE from viagens_voo where id_viagens_pacotes = '" + codigo +"'";
                    comando.ExecuteNonQuery();


                    comando.Parameters.Clear();

                    comando.CommandText = "DELETE from viagens_atividades where id_viagens_pacotes = '" + codigo + "'";
                    comando.ExecuteNonQuery();

                    comando.Parameters.Clear();

                     comando.CommandText = "DELETE from viagens_pacotes where id_viagens_pacotes = '" + codigo + "'";
                    comando.ExecuteNonQuery();

                    ligar.Close();



                    Session["validar_apagar_correct_editar_pack"] = "true";

                    Response.Redirect("Admin_editar_pack.aspx", false);
                }


                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_existe_algo_associado()", true);
                }



                //catch
                //{
                //    validar_eliminar = true;

                //    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_existe_algo_associado()", true);

                //}

                //finally
                //{

                //    if (validar_eliminar == false)
                //    {

                //        comando.Parameters.Clear();
                //        comando.CommandText = "DELETE from viagens_hoteis where id_viagens_pacotes ='" + codigo +"'";



                //        comando.ExecuteReader();

                //        comando.Parameters.Clear();

                //        comando.CommandText = "DELETE from viagens_voo where id_viagens_pacotes = '" + codigo+"'";



                //    }

                //}





                


            }
        }

       

        protected void Drop_pais_pack_SelectedIndexChanged(object sender, EventArgs e)
        {
            Drop_hotel.Enabled = true;

            adicionar_atividades.Enabled = true;

            Drop_voo_origem.Enabled = true;

            Sql_hoteis.SelectCommand = "SELECT hoteis.id_hoteis, hoteis.nome_hotel FROM  hoteis where hoteis.id_pais = " + Drop_pais_pack.SelectedValue + ";";

            

            Sql_voo_origem.SelectCommand = "SELECT id_voo, nome FROM voo where pais_destino = " + Drop_pais_pack.SelectedValue + ";";
        }

        protected void Drop_hotel_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Drop_voo_origem_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id_pais_origem = 0;
            Drop_voo_destino.Enabled = true;
            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand comando = new MySqlCommand();

            MySqlDataReader DR;

            comando.Connection = ligar;

            ligar.Open();

            comando.CommandText = "Select pais_origem from voo where id_voo = " + Drop_voo_origem.SelectedValue + ";";







            DR = comando.ExecuteReader();



            if (DR.Read())
            {
                id_pais_origem = Convert.ToInt32(DR["pais_origem"]);
            }




            ligar.Close();

            Sql_voo_destino.SelectCommand = "SELECT id_voo, nome FROM voo where pais_destino = " + id_pais_origem + " and pais_origem = " + Drop_pais_pack.SelectedValue + ";";

        }

        protected void Drop_voo_destino_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        

        protected void dia_partida_escrever_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void hoteis_grid_mostrar_PageIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void hoteis_grid_mostrar_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
          
        }

        protected void mostrar_hoteis_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {

        }

        protected void Drop_pais_pack_DataBound(object sender, EventArgs e)
        {


            Drop_hotel.Enabled = true;

            adicionar_atividades.Enabled = true;

            Drop_voo_origem.Enabled = true;

            Sql_hoteis.SelectCommand = "SELECT hoteis.id_hoteis, hoteis.nome_hotel FROM  hoteis where hoteis.id_pais = " + Drop_pais_pack.SelectedValue + ";";

            

            Sql_voo_origem.SelectCommand = "SELECT id_voo, nome FROM voo where pais_destino = " + Drop_pais_pack.SelectedValue + ";";



        }

        protected void reset_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_editar_pack.aspx", false);
        }

        protected void Drop_voo_origem_DataBound(object sender, EventArgs e)
        {
            int id_pais_origem = 0;
            Drop_voo_destino.Enabled = true;
            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand comando = new MySqlCommand();

            MySqlDataReader DR;

            comando.Connection = ligar;

            ligar.Open();

            comando.CommandText = "Select pais_origem from voo where id_voo = " + Drop_voo_origem.SelectedValue + ";";







            DR = comando.ExecuteReader();



            if (DR.Read())
            {
                id_pais_origem = Convert.ToInt32(DR["pais_origem"]);
            }




            ligar.Close();

            Sql_voo_destino.SelectCommand = "SELECT id_voo, nome FROM voo where pais_destino = " + id_pais_origem + " and pais_origem = " + Drop_pais_pack.SelectedValue + ";";

        }

        protected void hoteis_grid_mostrar_Load(object sender, EventArgs e)
        {
           
        }

        protected void hoteis_grid_mostrar_CallingDataMethods(object sender, CallingDataMethodsEventArgs e)
        {
          
        }

        protected void dia_chegada_escrever_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void voos_grid_mostrar_SelectedIndexChanged(object sender, EventArgs e)
        {
            linha = 0;
            linha = voos_grid_mostrar.SelectedIndex;



            id_viagens_pacotes_eliminar = "";
            id_viagens_pacotes_eliminar = voos_grid_mostrar.Rows[linha].Cells[1].Text;
            id_voos_eliminar = voos_grid_mostrar.Rows[linha].Cells[3].Text;

            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand comando = new MySqlCommand();




            ligar.Open();
            comando.CommandText = "DELETE from viagens_voo WHERE id_voo = @id_voo and id_viagens_pacotes = @id_viagens_pacotes";


            comando.Connection = ligar;


            comando.Parameters.AddWithValue("@id_viagens_pacotes", id_viagens_pacotes_eliminar);
            comando.Parameters.AddWithValue("@id_voo", id_voos_eliminar);


            try
            {

                comando.ExecuteNonQuery();

            }
            catch (Exception erro)
            {
                MessageBox.Show(erro.Message, "Erro");
            }
            id_voos_eliminar = "";
            ligar.Close();




            mostrar_voos.SelectCommand = "SELECT viagens_pacotes.nome_pacote, viagens_voo.id_voo, voo.nome AS nome_voo, viagens_voo.id_viagens_pacotes FROM viagens_voo INNER JOIN voo ON viagens_voo.id_voo = voo.id_voo INNER JOIN viagens_pacotes ON viagens_voo.id_viagens_pacotes = viagens_pacotes.id_viagens_pacotes WHERE viagens_voo.id_voo = voo.id_voo AND viagens_voo.id_viagens_pacotes = '" + Session["codigo_ver"] + "'";
        }

        protected void atividades_grid_mostrar_SelectedIndexChanged(object sender, EventArgs e)
        {
            linha = 0;
            linha = atividades_grid_mostrar.SelectedIndex;



            id_viagens_pacotes_eliminar = "";
            id_viagens_pacotes_eliminar = atividades_grid_mostrar.Rows[linha].Cells[1].Text;
            id_atividades_eliminar = atividades_grid_mostrar.Rows[linha].Cells[3].Text;

            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand comando = new MySqlCommand();




            ligar.Open();
            comando.CommandText = "delete from viagens_atividades where id_viagens_pacotes = @id_viagens_pacotes AND id_atividade = @id_atividade ";


            comando.Connection = ligar;


            comando.Parameters.AddWithValue("@id_viagens_pacotes", id_viagens_pacotes_eliminar);
            comando.Parameters.AddWithValue("@id_atividade", id_atividades_eliminar);


            try
            {

                comando.ExecuteNonQuery();

            }
            catch (Exception erro)
            {
                MessageBox.Show(erro.Message, "Erro");
            }
            id_voos_eliminar = "";
            ligar.Close();



            mostrar_atividades.SelectCommand = "SELECT viagens_pacotes.nome_pacote, viagens_atividades.id_atividade, atividade.nome, viagens_atividades.id_viagens_pacotes FROM viagens_atividades INNER JOIN atividade ON viagens_atividades.id_atividade = atividade.id_atividade INNER JOIN viagens_pacotes ON viagens_atividades.id_viagens_pacotes = viagens_pacotes.id_viagens_pacotes WHERE viagens_atividades.id_atividade = atividade.id_atividade AND viagens_atividades.id_viagens_pacotes = '" + Session["codigo_ver"] + "'";



        }

        protected void adicionar_hoteis_Click(object sender, EventArgs e)
        {
            //executar_hoteis();
            //MySqlConnection ligar = new MySqlConnection(configuracao);
            //MySqlCommand comando52 = new MySqlCommand();


            //comando52.Connection = ligar;










            //if (Panel_adicionar_hoteis.Visible == false)
            //{
            //    Panel_adicionar_hoteis.Visible = true;


            //    SqlDataSource3.SelectCommand = "SELECT hoteis.id_hoteis, hoteis.nome_hotel FROM hoteis WHERE hoteis.id_hoteis not in (SELECT viagens_hoteis.id_hoteis FROM viagens_hoteis WHERE viagens_hoteis.id_viagens_pacotes =  '" + Session["codigo"] + "')";



            //    adicionar_hoteis.Text = "Adicionar Hoteis";

            //}


            //else if (Panel_adicionar_hoteis.Visible == true)
            //{

            //    Panel_adicionar_hoteis.Visible = false;

            //    ligar.Open();

            //    adicionar_hoteis.Text = "Mostrar Hoteis";





            //    comando52.Connection = ligar;



            //    for (int i = 0; i < hoteis.Length; i++)
            //    {


            //        if (hoteis[i] != 0)
            //        {
            //            comando52.CommandText = "insert into viagens_hoteis(id_viagens_pacotes, id_hoteis) values('" + Convert.ToInt32(id_viagens_pacotes.Text) + "', '" + hoteis[i] + "'  )";



            //            comando52.ExecuteNonQuery();
            //        }
            //    }

            //    ligar.Close();

            //}
        }



        protected void hoteis_grid_mostrar_SelectedIndexChanged(object sender, EventArgs e)
        {

            linha = 0;
            linha = hoteis_grid_mostrar.SelectedIndex;



            id_viagens_pacotes_eliminar = "";
            id_viagens_pacotes_eliminar = hoteis_grid_mostrar.Rows[linha].Cells[1].Text;
            id_hoteis_eliminar = hoteis_grid_mostrar.Rows[linha].Cells[3].Text;

            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand comando = new MySqlCommand();




            ligar.Open();
            comando.CommandText = "DELETE from viagens_hoteis where viagens_hoteis.id_viagens_pacotes = @id_viagens_pacotes AND viagens_hoteis.id_hoteis = @id_hoteis ";


            comando.Connection = ligar;


            comando.Parameters.AddWithValue("@id_viagens_pacotes", id_viagens_pacotes_eliminar);
            comando.Parameters.AddWithValue("@id_hoteis", id_hoteis_eliminar);


            try
            {

                comando.ExecuteNonQuery();

            }
            catch (Exception erro)
            {
                MessageBox.Show(erro.Message, "Erro");
            }
            id_hoteis_eliminar = "";
            ligar.Close();










            mostrar_hoteis.SelectCommand = "SELECT viagens_pacotes.nome_pacote, viagens_hoteis.id_hoteis, hoteis.nome_hotel, viagens_hoteis.id_viagens_pacotes FROM viagens_hoteis INNER JOIN hoteis ON viagens_hoteis.id_hoteis = hoteis.id_hoteis INNER JOIN viagens_pacotes ON viagens_hoteis.id_viagens_pacotes = viagens_pacotes.id_viagens_pacotes WHERE viagens_hoteis.id_hoteis = hoteis.id_hoteis AND viagens_hoteis.id_viagens_pacotes = '" + Session["codigo_ver"] + "'";







        }

        protected void adicionar_atividades_Click(object sender, EventArgs e)
        {
            var data_entrada_v = new DateTime();
            var data_saida_v = new DateTime();
            var date = DateTime.Now;

            if (dia_chegada_escrever.Text != "" && dia_partida_escrever.Text != "")
            {

                data_entrada_v = Convert.ToDateTime(dia_partida_escrever.Text);
                data_saida_v = Convert.ToDateTime(dia_chegada_escrever.Text);
            }


            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_campos_preencher()", true);
            }












            if (Panel_adicionar_atividades.Visible == false)
            {
                if (nome_pacote.Text != "" && preco.Text != "" && descricao.Text != "" && dia_partida_escrever.Text != "" && dia_chegada_escrever.Text != "" && FileUpload1.FileName != "")
                {
                    if (data_entrada_v > date && data_saida_v > date)
                    {
                        if (data_saida_v > data_entrada_v)
                        {
                            if (Drop_voo_destino.SelectedValue != Drop_voo_origem.SelectedValue)
                            {
                                Session["foto_pack_editar"] = Path.GetFileName(FileUpload1.FileName);

                                editar.Visible = true;
                                adicionar_atividades.Visible = false;

                                reset.Visible = true;

                                Panel_adicionar_atividades.Visible = true;


                                Panel_tudo.Visible = false;
                                mostrar_tudo_inicial.Visible = false;

                                SqlDataSource5.SelectCommand = "SELECT atividade.id_atividade, atividade.nome FROM atividade WHERE atividade.id_atividade not in (SELECT viagens_atividades.id_atividade FROM viagens_atividades WHERE viagens_atividades.id_viagens_pacotes =  '" + Session["codigo"] + "') AND atividade.id_pais = " + Drop_pais_pack.SelectedValue + "";



                                adicionar_atividades.Text = "Voltar";
                            }
                            else
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_voo()", true);
                            }
                        }

                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "datas_erro()", true);
                        }
                    }

                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "datas_antes_hoje()", true);
                    }
                }

                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_campos_preencher()", true);
                }

            }


           
        }


    }

}






