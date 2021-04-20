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
            //Add key
            BitMiracle.Docotic.LicenseManager.AddLicenseData("");
            var outputData = new List<OutputData>();
            using (var pdf = new BitMiracle.Docotic.Pdf.PdfDocument(fileTableInfo.FileLocation))
            {
                var pageGroups = mappings.GroupBy(pg => pg.PageNumber);
                foreach(var pageGroup in pageGroups)
                { 
                    var pageNumber = pageGroup.Key;
                    var pageMappings = pageGroup.ToList();
                    var currentpage = pdf.GetPage(pageNumber);
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
    }
}
