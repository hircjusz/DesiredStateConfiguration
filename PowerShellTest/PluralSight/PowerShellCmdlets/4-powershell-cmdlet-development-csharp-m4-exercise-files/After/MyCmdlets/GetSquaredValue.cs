using System.Management.Automation;

namespace MyCmdlets
{
    [Cmdlet(VerbsCommon.Get, "SquaredValue")]
    public class GetSquaredValue : PSCmdlet
    {
        [Parameter(Position=1, ValueFromPipeline = true, Mandatory = true)]
        public int Number { get; set; }

        protected override void ProcessRecord()
        {
            WriteObject(Number * Number);
        }
    }
}