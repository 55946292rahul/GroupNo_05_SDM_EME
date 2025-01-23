using LoginWebRestApi.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Linq;

namespace LoginWebRestApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AreaController : ControllerBase
    {
        private readonly HospitalmanagementContext _context;

        public AreaController(HospitalmanagementContext context)
        {
            _context = context;
        }

        // GET: api/Area/getAreas/{cityId}
        [HttpGet("getAreas/{cityId}")]
        public IActionResult GetAreas(int cityId)
        {
            // Validate the cityId
            if (cityId <= 0)
            {
                return BadRequest("Invalid city ID.");
            }

            // Fetch areas from the database synchronously
            var areas = _context.Areas
                .Where(a => a.Cityid == cityId)
                .Select(a => new { a.Aid, a.Name })
                .ToList();

            // Check if any areas were found
            if (areas == null || areas.Count == 0)
            {
                return NotFound("No areas found for the given city ID.");
            }

            return Ok(areas);
        }
    }
}
