using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DE.Processing.DataAccess.Interfaces
{
    public interface IDataAccess
    {
        string GetConnectionString();
        string InsertAllData(string procedureName, List<SqlParameter[]> parameters);
        string RunProcedureForSingle(string procedureName, SqlParameter[] parameters);
        SqlDataReader GetSQLDataReader(string procedureName, SqlParameter[] parameters = null);
    }
}
