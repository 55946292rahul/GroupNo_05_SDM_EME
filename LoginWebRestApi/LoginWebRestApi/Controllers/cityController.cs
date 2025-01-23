using LoginWebRestApi.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LoginWebRestApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CityController : ControllerBase
    {
        private readonly HospitalmanagementContext _context;

        public CityController(HospitalmanagementContext context)
        {
            _context = context;
        }

       
        [HttpGet("getCities")]
        public async Task<IActionResult> GetCities()
        {
            var cities = await _context.Cities
                .Select(c => new { c.Cid, c.Name })
                .ToListAsync();

            return Ok(cities);
        }
    }
}
