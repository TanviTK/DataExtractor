using DE.Processing.DataAccess.Common;
using DE.Processing.DataAccess.Interfaces;
using DE.Processing.DataAccess.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DE.Processing.DataAccess.IndividualDataAccess
{
    public class FileReaderDataAccess
    {
        //private readonly IDataAccess IDataAccess; //instantiate readonly object of IDapper interface
        private readonly  CommonDataAccess Common; //instantiate readonly object of IDapper interface
     
        public FileReaderDataAccess()
        {
            Common = new CommonDataAccess();
        }
        public List<FileTableInfo> GetUprocessedFileData()
        {

            using (SqlDataReader reader = Common.GetSQLDataReader("GetUnprocessedFiles"))
            {
                List<FileTableInfo> fileTableList = new List<FileTableInfo>();
                FileTableInfo fileTableInfo = null;

                while (reader.Read())
                {
                    fileTableInfo = new FileTableInfo();
                    fileTableInfo.FileId = Convert.ToInt32(reader["FileId"].ToString());
                    fileTableInfo.ReceviedDate = Convert.ToDateTime(reader["ReceviedDate"]);
                    fileTableInfo.FileLocation = reader["FileLocation"].ToString();
                    fileTableInfo.IsProcessed = Convert.ToBoolean(reader["IsProcessed"]);
                    fileTableInfo.SettingId = Convert.ToInt32(reader["SettingId"].ToString());
                    fileTableList.Add(fileTableInfo);
                }

                return fileTableList;
            }
        }


        public List<Mappings> GetMappingDataForSettingId(int settingId)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter() {ParameterName = "@id", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Input, Value = settingId}
            };

            using (SqlDataReader reader = Common.GetSQLDataReader("GetMapForSettingId", parameters))
            {
                List<Mappings> mappingList = new List<Mappings>();
                Mappings mappingInfo = new Mappings();

                while (reader.Read())
                {
                    mappingInfo = new Mappings();
                    mappingInfo.MappingId = Convert.ToInt32(reader["MappingId"].ToString());
                    mappingInfo.MapType = reader["MapType"].ToString();
                    mappingInfo.MapName = reader["MapName"].ToString();
                    mappingInfo.ExecutionType = reader["ExecutionType"].ToString();
                    mappingInfo.SettingId = Convert.ToInt32(reader["SettingId"].ToString());
                    mappingInfo.PageNumber = Convert.ToInt32(reader["PageNumber"].ToString());
                    mappingInfo.Position = Convert.ToInt32(reader["Position"].ToString());
                    mappingList.Add(mappingInfo);
                }

                return mappingList;
            }
        }

        public string InsertDataIntoOutputTable(List<OutputData> outputDataList)
        {
            try
            {
                List<SqlParameter[]> sqlParameters = new List<SqlParameter[]>();
                foreach (OutputData outputData in outputDataList)
                {
                    SqlParameter[] parameters = new SqlParameter[]
                    {
                        new SqlParameter() {ParameterName = "@dataType", SqlDbType = SqlDbType.NVarChar, Direction = ParameterDirection.Input, Value = outputData.DataType},
                        new SqlParameter() {ParameterName = "@outVal", SqlDbType = SqlDbType.NVarChar, Direction = ParameterDirection.Input, Value = outputData.Value},
                        new SqlParameter() {ParameterName = "@fileId", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Input, Value = outputData.FileId},
                        new SqlParameter() {ParameterName = "@pageNum", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Input, Value = outputData.PageNumber}
                    };
                    sqlParameters.Add(parameters);
                }
                var x = Common.InsertAllData("InsertDataIntoOutputTable", sqlParameters);

                return "Successfully added the data to outputtable";
            }
            catch (Exception ex)
            {
                return $"Error : {ex.Message}";
            }
        }

        public string UpdateFileTable(int fileId)
        {
            try
            {
                SqlParameter[] parameters = new SqlParameter[]
                {
                        new SqlParameter() {ParameterName = "@id", SqlDbType = SqlDbType.Int, Direction = ParameterDirection.Input, Value = fileId}
                };

                var x = Common.RunProcedureForSingle("UpdateFileTable", parameters);
                return "Successfully updated the isProcessed column";
            }
            catch (Exception ex)
            {
                return $"Error : {ex.Message}";
            }
        }
    }
}
