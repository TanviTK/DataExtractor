using BitMiracle.Docotic.Pdf;
using DE.Processing.DataAccess.Models;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text.RegularExpressions;

namespace DE.Processing.Processors.Factory.PDF
{
    public class PdfL2L
    {
        public static List<OutputData> ProcessData(List<Mappings> mappings, FileTableInfo fileTableInfo)
        {
            var outputData = new List<OutputData>();
            using (var pdf = new PdfDocument(fileTableInfo.FileLocation))
            {
                string folder = fileTableInfo.FileLocation.Substring(0, fileTableInfo.FileLocation.LastIndexOf("\\")+1);
                var pageGroups = mappings.GroupBy(pg => pg.PageNumber);
                foreach(var pageGroup in pageGroups)
                { 
                    var pageNumber = pageGroup.Key;
                    var pageMappings = pageGroup.ToList();

                    // use the below code to extract the original to seperate pdfs and create a copy of the original.
                    PdfDocument page = pdf.ExtractPages(pageNumber, 1);
                    var orignal = pdf.CopyPages(0, pdf.PageCount);
                    ExtractPdfToLoaction(pageNumber, orignal, folder);
                    var currentpage = new PdfDocument($@"{folder}\{pageNumber}.pdf");

                    // Code with out seperating the pdf files . Comment out the below line if seperating
                    //var currentpage = pdf.GetPage(pageNumber);

                    string formattedText = currentpage.GetTextWithFormatting();
                    string modifiedText = Regex.Replace(formattedText, @"['$,]", string.Empty);
                    modifiedText = Regex.Replace(modifiedText, @"(?<=\b)\p{Zs}(?=\b)", string.Empty);
                    string[] strArray = Regex.Split(modifiedText, @"\s+");
                    foreach (var map in pageMappings)
                    {
                        var amount = PdfFactory.GetNextPositionValue(strArray, map.MapName, map.Position);
                        if (amount[0] == '(' && amount[amount.Length - 1] == ')')
                        {
                            amount = "-" + Regex.Replace(amount, @"[)(]", string.Empty); ;
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

        public static void ExtractPdfToLoaction(int pagenumber, PdfDocument original, string folder)
        {
            // extract first 3 pages. These pages will be removed from original PDF document.
            using (PdfDocument extracted = original.ExtractPages(pagenumber, 1))
            {
                // Helps to reduce file size in cases when the extracted pages reference
                // unused resources such as fonts, images, patterns.
                extracted.RemoveUnusedResources();

                extracted.Save($@"{folder}\{pagenumber}.pdf");
            }
            

        }
    }
}
