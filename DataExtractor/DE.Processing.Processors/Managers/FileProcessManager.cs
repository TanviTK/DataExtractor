using DE.Processing.DataAccess.IndividualDataAccess;
using DE.Processing.DataAccess.Models;
using DE.Processing.Processors.Intefaces;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DE.Processing.Processors.Managers
{
    public class FileProcessManager
    {
        public static void ProcessFiles()
        {
            //get all the files with isprocessed = 0
            FileReaderDataAccess fileReaderDataAccess = new FileReaderDataAccess();
            List<FileTableInfo> unProcessedFiles = fileReaderDataAccess.GetUprocessedFileData();

            foreach (FileTableInfo file in unProcessedFiles)
            {
                IProcessor processor = GetFileTypeProcesser(file);
                processor.ProcessFiles();
            }
        }

        private static IProcessor GetFileTypeProcesser(FileTableInfo file)
        {
            string fileExtension = Path.GetExtension(file.FileLocation);

            if (fileExtension.ToLower() == ".pdf" )
                return new Factory.PDF.PdfFactory(file);

            throw new NotImplementedException();
        }
    }
}
