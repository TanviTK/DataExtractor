using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DE.Processing.DataAccess.Models
{
    public class FileTableInfo
    {
        public int FileId { get; set; }
        public DateTime ReceviedDate { get; set; }
        public string FileLocation { get; set; }
        public bool IsProcessed { get; set; }
        public int SettingId { get; set; }
    }
}
