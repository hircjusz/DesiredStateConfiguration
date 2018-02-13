using System;
using System.IO;
using System.Linq;
using System.Management.Automation;
using System.Reflection;

namespace MyCmdlets
{
    [Cmdlet(VerbsCommon.Get, "RandomName")]
    public class GetRandomName : Cmdlet
    {
        [Parameter(Position=1, Mandatory=true, ValueFromPipeline=true)]
        public string Name { get; set; }

        protected override void ProcessRecord()
        {
            WriteObject(
                _names.Where(n => n.Length == Name.Length)
                      .OrderBy(n => Guid.NewGuid())
                      .First()
                );
        }

        protected override void BeginProcessing()
        {
            WriteVerbose("Loading names file.");

            _names = File.ReadAllLines(
                Path.Combine(
                    Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location),
                    "GetRandomName.txt"
                    )
                );
        }

        protected override void EndProcessing()
        {
        }

        protected override void StopProcessing()
        {
        }

        private string[] _names;
    }
}
