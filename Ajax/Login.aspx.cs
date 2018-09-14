using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ajax
{
    public partial class Login : System.Web.UI.Page
    {
        static string conStr = ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
        [WebMethod(EnableSession = true), ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string Loguear(string usuario, string password)
        {
            string rpt = string.Empty;
            SqlConnection con = new SqlConnection(conStr);
            try
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    DataTable dt = new DataTable();
                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "validarUser";
                    cmd.Parameters.AddWithValue("@Usuario", usuario);
                    cmd.Parameters.AddWithValue("@Contraseña", password);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    sda.Fill(dt);
                    con.Close();
                    rpt = (dt.Rows.Count > 0) ? "Bienvenido" : "Usuario y/o contraseña Incorrectos";
                }
                return rpt;
            }
            catch (Exception e)
            {

                return e.Message;
            }
            return rpt;

        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}