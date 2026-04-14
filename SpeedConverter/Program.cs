using SpeedConverter.Tests;

namespace SpeedConverter
{
    internal class Program
    {
        static void RunTest(SpeedConversionServiceTests framework, int kph, int exptectedMph)
        {
            var result = framework.ConvertToMilesPerHour_Input_Expected(kph, exptectedMph);
            Console.WriteLine($"KPH: {kph} == MPH: {exptectedMph} : {result}");
        }

        static void Main(string[] args)
        {
            using (var tester  = new SpeedConversionServiceTests())
            {
                RunTest(tester, 10, 6);
                RunTest(tester, 11, 7);
                RunTest(tester, 20, 12);
            }
        }
    }
}
