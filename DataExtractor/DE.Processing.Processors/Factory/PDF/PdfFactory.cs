using DE.Processing.DataAccess.IndividualDataAccess;
using DE.Processing.DataAccess.Interfaces;
using DE.Processing.DataAccess.Models;
using DE.Processing.Processors.Intefaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

namespace DE.Processing.Processors.Factory.PDF
{
    public class PdfFactory : IProcessor
    {
        private FileTableInfo FileTable { get; set; }
        private List<Mappings> MappingData { get; set; }
        private List<OutputData> OutputTableData { get; set; }
        private FileReaderDataAccess FileReaderDataAccess { get; set; }

        public PdfFactory(FileTableInfo file)
        {
            FileTable = new FileTableInfo();
            MappingData = new List<Mappings>();
            OutputTableData = new List<OutputData>();
            FileTable = file;
            FileReaderDataAccess = new FileReaderDataAccess();
            LoadData();
        }
        public void ProcessFiles()
        {
            FileReaderDataAccess = new FileReaderDataAccess();

            var mapGroup= MappingData.GroupBy(map => map.ExecutionType);

            foreach(var executionType in mapGroup)
            {
                if(executionType.Key == "L2L")
                {
                    OutputTableData.AddRange(PdfL2L.ProcessData(MappingData, FileTable));
                }
            }
            FileReaderDataAccess.InsertDataIntoOutputTable(OutputTableData);
            FileReaderDataAccess.UpdateFileTable(FileTable.FileId);
        }

        private void LoadData()
        {
            if (FileTable == null)
            {
                throw new KeyNotFoundException();
            }
            MappingData = FileReaderDataAccess.GetMappingDataForSettingId(FileTable.SettingId);
        }

        #region Helper
        public static string GetNextPositionValue(string[] strArray, string type, int position)
        {
            var index = Array.IndexOf(strArray, type) + position;
            return strArray[index];
        }
        #endregion Helper 
    }
}
