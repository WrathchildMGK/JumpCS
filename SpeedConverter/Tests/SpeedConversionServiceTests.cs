using SpeedConverter.Code;

namespace SpeedConverter.Tests
{
    public class SpeedConversionServiceTests : IDisposable
    {
        private readonly SpeedConversionService speedConverter;

        public SpeedConversionServiceTests()
        {
            speedConverter = new SpeedConversionService();
        }

        public bool ConvertToMilesPerHour_Input_Expected(int input, int expected)
        {
            var milesPerHour = speedConverter.ConvertToMilesPerHour(input);

            return (expected == milesPerHour);
        }

        public void Dispose()
        {
            // no-op
        }
    }
}