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
    public partial class admin_criar_pack : System.Web.UI.Page
    {

        bool validar = false;

    
        string configuracao = "server=localhost; userid=root; database=bd_agencia_viagens";



        int[] atividades = new int[20];
        int[] hoteis = new int[20];
        int[] voos = new int[20];



        int i_atividades;
    


        int max;


        protected void Page_Load(object sender, EventArgs e)
        {


            i_atividades = 0;


            if (Session["validar_correct_pack"] == "true")
            {
                Session["validar_correct_pack"] = "false";
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Correct()", true);

            }

      




        }

        protected void editar_Click(object sender, EventArgs e)
        {

         

           

            if (Session["validar_atividades"] == "true")
            {
                if (nome_pacote.Text != "" && preco.Text != "" && descricao.Text != "" && dia_partida.Text != "" && dia_chegada.Text != "" && Session["foto_pack"] != "")
                {







                    executar_atividade();



                    MySqlConnection ligar = new MySqlConnection(configuracao);
                    MySqlCommand comando = new MySqlCommand();

                    comando.Connection = ligar;

                    ligar.Open();


                    string filename = Session["foto_pack"].ToString();





                    if (validar == true)
                    {
                        if (filename != "")
                        {

                            if (filename != "")
                            {
                                FileUpload1.SaveAs(Server.MapPath("images/") + filename);

                                comando.CommandText = "insert into viagens_pacotes(nome_pacote, preço, id_pais, descricao, imagem, data_partida, data_chegada) values (@nome, @preco, @id_pais, @descricao, @imagem, @data_partida, @data_chegada)";




                                comando.Parameters.AddWithValue("@nome", nome_pacote.Text);
                                comando.Parameters.AddWithValue("@id_pais", Drop_pais_pack.SelectedValue);
                                comando.Parameters.AddWithValue("@preco", preco.Text);
                                comando.Parameters.AddWithValue("@descricao", descricao.Text);
                                comando.Parameters.AddWithValue("@imagem", filename.ToString());
                                comando.Parameters.AddWithValue("@data_partida", dia_partida.Text);
                                comando.Parameters.AddWithValue("@data_chegada", dia_chegada.Text);
                                comando.ExecuteNonQuery();



                                Session["validar_correct_pack"] = "true";


                            }

                            else
                            {

                                comando.CommandText = "insert into viagens_pacotes(nome_pacote, preço, id_pais, descricao, data_partida, data_chegada) values (@nome, @preco, @id_pais, @descricao, @data_partida, @data_chegada)";

                                comando.Parameters.AddWithValue("@nome", nome_pacote.Text);
                                comando.Parameters.AddWithValue("@id_pais", Drop_pais_pack.SelectedValue);
                                comando.Parameters.AddWithValue("@preco", preco.Text);
                                comando.Parameters.AddWithValue("@descricao", descricao.Text);
                                comando.Parameters.AddWithValue("@data_partida", dia_partida.Text);
                                comando.Parameters.AddWithValue("@data_chegada", dia_chegada.Text);

                                comando.ExecuteNonQuery();

                                Session["validar_correct_pack"] = "true";



                            }

                        }








                        ligar.Close();





                        MySqlCommand comando2 = new MySqlCommand();
                        MySqlDataReader DR;

                        comando2.Connection = ligar;

                        ligar.Open();

                        comando2.CommandText = "Select max(id_viagens_pacotes) AS max from viagens_pacotes";

                        DR = comando2.ExecuteReader();



                        if (DR.Read())
                        {
                            max = Convert.ToInt32(DR["max"]);
                        }

                        ligar.Close();



                        ligar.Open();

                        if (filename != "")
                        {

                            for (int u = 0; u < Convert.ToInt32(Session["id_atividade2.0"]); u++)
                            {



                                MySqlCommand comando3 = new MySqlCommand();

                                comando3.Connection = ligar;


                                comando3.CommandText = "insert into viagens_atividades(id_viagens_pacotes, id_atividade) values('" + Convert.ToInt32(max) + "', '" + atividades[u] + "'  )";



                                comando3.ExecuteNonQuery();




                            }
                        }

                        ligar.Close();
                        ligar.Open();







                        if (filename != "")
                        {
                            MySqlCommand comando4 = new MySqlCommand();

                            comando4.Connection = ligar;


                            comando4.CommandText = "insert into viagens_hoteis(id_viagens_pacotes, id_hoteis) values('" + Convert.ToInt32(max) + "', '" + Drop_hotel.SelectedValue + "'  )";



                            comando4.ExecuteNonQuery();


                        }


                        ligar.Close();
                        ligar.Open();




                        if (filename != "")
                        {

                            MySqlCommand comando5 = new MySqlCommand();

                            comando5.Connection = ligar;


                            comando5.CommandText = "insert into viagens_voo(id_viagens_pacotes, id_voo) values('" + Convert.ToInt32(max) + "', '" + Drop_voo_origem.SelectedValue + "'  )";



                            comando5.ExecuteNonQuery();


                            comando5.CommandText = "insert into viagens_voo(id_viagens_pacotes, id_voo) values('" + Convert.ToInt32(max) + "', '" + Drop_voo_destino.SelectedValue + "'  )";



                            comando5.ExecuteNonQuery();


                        }

                        ligar.Close();


                        Response.Redirect("admin_criar_pack.aspx", false);









                      

                    }


                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_escolher_atividade()", true);
                    }
                }

                
            }


            else
            {
                MessageBox.Show("Antes de criar tem que adicionar as atividades do respetivo pack", "Erro");
            }

        }

        protected void Eliminar_Click(object sender, EventArgs e)
        {

        }
        public void executar_atividade()
        {



                string configuracao2 = "server=localhost; userid=root; database=bd_agencia_viagens";
                MySqlConnection ligar2 = new MySqlConnection(configuracao2);
                MySqlCommand comando2 = new MySqlCommand();

                comando2.Connection = ligar2;
                ligar2.Open();

           
            

                for (int t = 0; t < GridView2.Rows.Count; t++)
                {
                    System.Web.UI.WebControls.CheckBox ChkBoxRows = (System.Web.UI.WebControls.CheckBox)GridView2.Rows[t].Cells[0].FindControl("CheckBox1");

                    if (ChkBoxRows.Checked == true)
                    {
                    validar = true;
                        atividades[i_atividades] = Convert.ToInt32(GridView2.Rows[t].Cells[1].Text);



                        i_atividades++;

                    }


                }


            Session["id_atividade2.0"] = Convert.ToString(i_atividades);




                ligar2.Close();




  

        }







        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Drop_hotel.Enabled = true;

            Mostrar_atividades.Enabled = true;
            
            Drop_voo_origem.Enabled = true;

            Sql_hoteis.SelectCommand = "SELECT hoteis.id_hoteis, hoteis.nome_hotel FROM  hoteis where hoteis.id_pais = "+ Drop_pais_pack.SelectedValue+ ";";

            
                

            Sql_voo_origem.SelectCommand= "SELECT id_voo, nome FROM voo where pais_destino = "+ Drop_pais_pack.SelectedValue + ";";

            carregar_tabelas_atividade.SelectCommand = "SELECT id_atividade, nome, preco as preço FROM atividade where id_pais = " + Drop_pais_pack.SelectedValue + ";";
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

        protected void Mostrar_atividades_Click(object sender, EventArgs e)
        {
            var data_entrada_v = new DateTime();
            var data_saida_v = new DateTime();
            var date = DateTime.Now;

            if (dia_chegada.Text != "" && dia_partida.Text != "")
            {

                data_entrada_v = Convert.ToDateTime(dia_partida.Text);
                data_saida_v = Convert.ToDateTime(dia_chegada.Text);
            }


            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_campos_preencher()", true);
            }

            if (Panel_tudo.Visible == true)
            {
                if (nome_pacote.Text != "" && preco.Text != "" && descricao.Text != "" && dia_partida.Text != "" && dia_chegada.Text != "" && FileUpload1.FileName != "" ) {

                    if (data_entrada_v > date && data_saida_v > date )
                    {
                        if (data_saida_v > data_entrada_v)
                        {
                            if (Drop_voo_destino.SelectedValue != Drop_voo_origem.SelectedValue)
                            {

                                Session["foto_pack"] = Path.GetFileName(FileUpload1.FileName);
                                Session["validar_atividades"] = "true";
                                Panel_tudo.Visible = false;
                                Panel_atividades.Visible = true;
                                Mostrar_atividades.Text = "Mostrar pack";
                                Mostrar_atividades.Visible = false;
                                editar.Visible = true;
                                reset.Visible = true;


                                carregar_tabelas_atividade.SelectCommand = "SELECT id_atividade, nome, preco as preço FROM atividade where id_pais = " + Drop_pais_pack.SelectedValue + ";";
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

        protected void Drop_pais_pack_DataBound(object sender, EventArgs e)
        {



            Drop_hotel.Enabled = true;

            Mostrar_atividades.Enabled = true;

            Drop_voo_origem.Enabled = true;

            Sql_hoteis.SelectCommand = "SELECT hoteis.id_hoteis, hoteis.nome_hotel FROM  hoteis where hoteis.id_pais = " + Drop_pais_pack.SelectedValue + ";";




            Sql_voo_origem.SelectCommand = "SELECT id_voo, nome FROM voo where pais_destino = " + Drop_pais_pack.SelectedValue + ";";



        }

        protected void Drop_pais_pack_CallingDataMethods(object sender, CallingDataMethodsEventArgs e)
        {

        }

        protected void carregar_tabelas_atividade_Load(object sender, EventArgs e)
        {

          



        }

        protected void reset_Click(object sender, EventArgs e)
        {
            Response.Redirect("admin_criar_pack.aspx", false);
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
    }
}
    
