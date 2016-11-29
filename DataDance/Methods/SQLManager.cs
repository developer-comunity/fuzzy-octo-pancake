using System;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;

namespace DataDance.Methods
{
    public class SQLManager
    {
        public static DataSet Ejecutar_Query_Con_Sp(string storeProcedure, params SqlParameter[] parametros)
        {
            DataSet dataset = null;
            SqlCommand command;
            SqlDataAdapter sqlDataAdapter;

            string connectionString = @"Data Source=148.234.130.183;Initial Catalog=DataDance;Persist Security Info=True;User ID=jlope;Password=123";

            SqlConnection cnn = new SqlConnection(connectionString);

            try
            {
                cnn.Open();
                command = new SqlCommand(storeProcedure, cnn);
                command.CommandType = CommandType.StoredProcedure;

                for (int i = 0; i < parametros.Length; i++)
                {
                    command.Parameters.Add(parametros[i]);
                }
                sqlDataAdapter = new SqlDataAdapter(command);
                dataset = new DataSet();
                sqlDataAdapter.Fill(dataset);
                cnn.Close();
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex);
                Debug.WriteLine(ex.StackTrace);
                dataset = null;
            }
            return dataset;
        }
    }
}