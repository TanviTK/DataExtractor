using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DE.Processing.DataAccess.Models
{
    public class OutputData
    {
        public int OutputId { get; set; }
        public string DataType { get; set; }
        public string Value { get; set; }
        public int FileId { get; set; }
        public int PageNumber { get; set; }
    }
}
