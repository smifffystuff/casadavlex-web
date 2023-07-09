using CasaDavLex.com.Server.Repositories;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace CasaDavLex.com.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ImagesController : ControllerBase
    {
        private readonly IImageRepository _imageRepository;

        public ImagesController(IImageRepository imageRepository)
        {
            _imageRepository = imageRepository;
        }

        [HttpGet]
        public async Task<IEnumerable<string>> Get()
        {
            return await _imageRepository.GetAllAsync();
            
        }
    }
}
