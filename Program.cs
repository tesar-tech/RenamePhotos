using System;
using System.Diagnostics;
using System.IO;

namespace RenamePhotos
{
    class Program
    {
        static void Main(string[] args)
        {
            //var currDir = Directory.GetCurrentDirectory(); 
            string scriptPath = Path.Combine(AppContext.BaseDirectory, "script.ps1");
            if (File.Exists(scriptPath))
            {//https://stackoverflow.com/questions/30844292/running-a-powershell-script-from-c-sharp
                File.GetAttributes(scriptPath);
                var process = new Process();
                process.StartInfo.UseShellExecute = false;
                process.StartInfo.RedirectStandardOutput = true;
                process.StartInfo.FileName = @"C:\windows\system32\windowspowershell\v1.0\powershell.exe";
                process.StartInfo.Arguments = $"{scriptPath}";

                process.Start();
                string s = process.StandardOutput.ReadToEnd();
                process.WaitForExit();
                Console.Write(s);
            }
        }
    }
}
