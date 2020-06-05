using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AcessosDadosDAO
{
    public class ConexaoDAO
    {
        string strConexao = "Server=localhost;Port=3306;Database=dbcadastroaluno;Uid=userdbcadastroaluno;Pwd=Pearra1234;";

        public ConexaoDAO() { }


        public DataTable ExecuteQuery(string Query)
        {
            try
            {
                using (MySql.Data.MySqlClient.MySqlConnection conn = new MySqlConnection(strConexao))
                {
                    conn.Open();

                    DataTable dtResultado = new DataTable();
                    MySqlCommand cmd = new MySqlCommand(Query, conn);
                    MySqlDataAdapter mySqlDataAdapter = new MySqlDataAdapter(cmd);
                    mySqlDataAdapter.Fill(dtResultado);

                    conn.Close();

                    return dtResultado;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        //Método para receber um insert, update ou delete
        public bool ExecuteNonQuery(string Comando)
        {
            try
            {
                using (MySql.Data.MySqlClient.MySqlConnection conn = new MySqlConnection(strConexao))
                {
                    conn.Open();

                    MySqlCommand cmd = new MySqlCommand(Comando, conn);
                    cmd.ExecuteNonQuery();

                    conn.Close();

                    return true;
                }
            }
            catch (Exception ex)
            {
                return false;
            }

        }
    }
}
