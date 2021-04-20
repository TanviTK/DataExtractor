using DE.Processing.DataAccess.Interfaces;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DE.Processing.DataAccess.Common
{
    public class CommonDataAccess //: IDataAccess
    {
        public string GetConnectionString()
        {
            var serverName = ".";//ConfigurationManager.AppSettings["Server"];
            var databaseName = "Hemanth_All_Test";//ConfigurationManager.AppSettings["DataBase"];

            SqlConnectionStringBuilder csBuilder = new SqlConnectionStringBuilder();
            csBuilder.InitialCatalog = databaseName;
            csBuilder.DataSource = serverName;
            csBuilder.PersistSecurityInfo = false;
            csBuilder.IntegratedSecurity = true;
            var connString = csBuilder.ConnectionString;

            return connString;
        }

      
        public SqlDataReader GetSQLDataReader(string procedureName, SqlParameter[] parameters = null)
        {
        
            SqlConnection connection = new SqlConnection(this.GetConnectionString());

            connection.Open();
            SqlCommand command = new SqlCommand(procedureName, connection);
            command.CommandType = CommandType.StoredProcedure;
            if(parameters != null)
            {
                command.Parameters.AddRange(parameters);
            }
            SqlDataReader reader = command.ExecuteReader();
            return reader;
           
        }


        public string  InsertAllData(string procedureName, List<SqlParameter[]> sqlParameters)
        {
            using (SqlConnection connection = new SqlConnection(this.GetConnectionString()))
            {
                foreach (var parameters in sqlParameters)
                {
                    using (SqlCommand command = new SqlCommand(procedureName, connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddRange(parameters);
                        connection.Open();
                        int result = command.ExecuteNonQuery();
                        connection.Close();
                    }
                }
            }
            return string.Empty;
        }

   

        public string RunProcedureForSingle(string procedureName, SqlParameter[] parameters)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(this.GetConnectionString()))
                {
                    connection.Open();
                    using (SqlCommand command = new SqlCommand(procedureName, connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddRange(parameters);
                        command.ExecuteNonQuery();
                    }
                }
                return "Successfully updated the isProcessed column";
            }
            catch (Exception ex)
            {
                return $"Error : {ex.Message}";
            }
        }
    }
}
