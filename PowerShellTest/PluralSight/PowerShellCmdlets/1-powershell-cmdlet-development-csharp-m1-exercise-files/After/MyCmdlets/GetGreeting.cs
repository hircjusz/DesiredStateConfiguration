using System;
using System.Management.Automation;

namespace MyCmdlets
{
    [Cmdlet("Get", "Greeting")]
    public class GetGreeting : Cmdlet
    {
        public GetGreeting()
        {
            Console.WriteLine("Hello World!");
        }
    }
}
