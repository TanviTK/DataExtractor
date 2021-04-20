using BitMiracle.Docotic.Pdf;
using DE.Processing.DataAccess.Models;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;

namespace DE.Processing.Processors.Factory.PDF
{
    public class PdfL2L
    {
        public static List<OutputData> ProcessData(List<Mappings> mappings, FileTableInfo fileTableInfo)
        {
            var outputData = new List<OutputData>();
            using (var pdf = new BitMiracle.Docotic.Pdf.PdfDocument(fileTableInfo.FileLocation))
            {
                string folder = fileTableInfo.FileLocation.Substring(0, fileTableInfo.FileLocation.LastIndexOf("\\")+1);

                //Extract pdf into individual files and save in same location
                SplitAndSave(fileTableInfo.FileLocation);

                var pageGroups = mappings.GroupBy(pg => pg.PageNumber);
                
                foreach(var pageGroup in pageGroups)
                { 
                    var pageNumber = pageGroup.Key;
                    var pageMappings = pageGroup.ToList();
                    // use the below code to extract the original to seperate pdfs and create a copy of the original.
                    //PdfDocument page = pdf.ExtractPages(pageNumber, 1);
                    //var orignal = pdf.CopyPages(0, pdf.PageCount);
                    //ExtractPdfToLoaction(pageNumber, orignal, folder);

                    // Code with out seperating the pdf files. Comment out the below line if not seperating
                    //var currentpage = pdf.GetPage(pageNumber);

                    var currentpage = new BitMiracle.Docotic.Pdf.PdfDocument($@"{fileTableInfo.FileLocation.Substring(0, fileTableInfo.FileLocation.LastIndexOf("."))}{pageNumber + 2}.pdf");
                    string formattedText = currentpage.GetTextWithFormatting();
                    string modifiedText = Regex.Replace(formattedText, @"['$]", string.Empty);
                    var strArray = System.Text.RegularExpressions.Regex.Split(modifiedText, @"\s{2,}");
                    foreach (var map in pageMappings)
                    {
                        var amount = PdfFactory.GetNextPositionValue(strArray, map.MapName, map.Position);
                        amount = Regex.Replace(amount, @"[,]", string.Empty);
                        if (amount[0] == '(' && amount[amount.Length - 1] == ')')
                        {
                            amount = "-" + Regex.Replace(amount, @"[)(]", string.Empty);
                        }
                        outputData.Add(new OutputData
                        {
                            FileId = fileTableInfo.FileId,
                            DataType = map.MapType,
                            Value = amount,
                            PageNumber = map.PageNumber
                        });
                    }
                }
            }
            return outputData;
        }

        public static void SplitAndSave(string inputPath)
        {
            FileInfo file = new FileInfo(inputPath);
            string name = file.Name.Substring(0, file.Name.LastIndexOf("."));
            string folder = inputPath.Substring(0, inputPath.LastIndexOf("\\") + 1);
            using (PdfReader reader = new PdfReader(inputPath))
            {
                for (int pagenumber = 1; pagenumber <= reader.NumberOfPages; pagenumber++)
                {
                    string filename = pagenumber.ToString() + ".pdf";

                    Document document = new Document();
                    PdfCopy copy = new PdfCopy(document, new FileStream(folder + "\\" + name + filename, FileMode.Create));

                    document.Open();

                    copy.AddPage(copy.GetImportedPage(reader, pagenumber));

                    document.Close();
                }
            }
        }
    }
}
